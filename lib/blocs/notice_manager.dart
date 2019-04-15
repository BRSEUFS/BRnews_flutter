import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ovix/models/noticeModel.dart';
import 'package:ovix/service/NoticeService.dart';
import 'package:rxdart/rxdart.dart';

class NoticeManager {

  List<NoticeModel> _noticesList = [];
  List<NoticeModel> _noticesPreload = [];

  final _noticeService = NoticeService();

  final _notices = BehaviorSubject<List<NoticeModel>>();
  final _isLoading = BehaviorSubject<bool>();

  Stream<List<NoticeModel>> get notices => _notices.stream;
  Stream<bool> get isLoading => _isLoading.stream;

  int _page = 0;
  bool _firstPage = true;
  bool _pagination = true;

  NoticeManager(){
    fetch();
  }

  void _preload() async{
    BuildContext context;
    _noticesPreload = await  _noticeService.getNotices(context, _page+1);

    if(_noticesPreload.length == 0){
      _pagination = false;
    }
  }

  void fetch() async{

    BuildContext context;

   if(_pagination) {
     if (_firstPage) {
       _page += 1;
       _noticesList = await _noticeService.getNotices(context, _page);
       _preload();
       _firstPage = false;
     } else {
       _isLoading.add(true);
       _noticesList.addAll(_noticesPreload);
       _page += 1;
       _preload();
       _isLoading.add(false);
     }
     _notices.add(_noticesList);
   }
  }

  dispose(){
    _notices.close();
    _isLoading.close();
  }
}