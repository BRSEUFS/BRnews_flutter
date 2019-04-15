import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ovix/blocs/notice_manager.dart';
import 'package:ovix/models/noticeModel.dart';
import 'package:ovix/service/NoticeService.dart';
import 'package:ovix/widgets/card_notice_line.dart';
import 'package:ovix/widgets/drawer_menu.dart';

class NoticesPage extends StatefulWidget {
  @override
  _NoticesPage createState() => _NoticesPage();
}

class _NoticesPage extends State<NoticesPage> {
  NoticeManager _manager = NoticeManager();

  ScrollController _scrollController;
  NoticeService noticeService = NoticeService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(50, 0, 0, 0),
        title: Text(
          'BR News',
          style: TextStyle(
            fontFamily: 'Aref Ruqaa',
            fontSize: 25.0,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.search,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: RefreshIndicator(
        child: Container(
          child: Column(
            children: <Widget>[
              StreamBuilder<List<NoticeModel>>(
                initialData: [],
                stream: _manager.notices,
                builder: ((context, snapshot) {
                  var allNotices = snapshot.data;

                  if (snapshot.data.isNotEmpty) {
                    return Expanded(
                      child: ListView.builder(
                          controller: _scrollController,
                          itemCount: allNotices.length,
                          itemBuilder: (context, index) {
                            if (allNotices[index].content != null)
                              return CardLineNotice(notice: allNotices[index]);
                          }),
                    );
                  } else {
                    return Container(
                      padding: EdgeInsets.only(top: 20),
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
              ),
              StreamBuilder<bool>(
                initialData: false,
                stream: _manager.isLoading,
                builder: ((context, snapshot) {
                  if (snapshot.data == true) {
                    return Container(
                      color: Colors.transparent,
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Container();
                  }
                }),
              ),
            ],
          ),
        ),
        onRefresh: () async {
          Future.delayed(Duration(seconds: 500));
        },
        color: Color(Colors.red.value),
      ),
    );
  }

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _manager.fetch();
    }
    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      print("TOP");
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _manager.dispose();
  }
}
