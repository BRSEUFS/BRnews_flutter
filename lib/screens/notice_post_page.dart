import 'package:flutter/material.dart';
import 'package:ovix/models/noticeModel.dart';
import 'package:ovix/util/utils.dart';

class NoticePostPage extends StatelessWidget {
  const NoticePostPage({
    Key key,
    @required this.post,
  }) : super(key: key);

  final NoticeModel post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(130, 0, 0, 0),
        title: const Text(
          'BR News Reaser',
          style: TextStyle(
            fontFamily: 'Aref Ruqaa',
            fontSize: 25.0,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 15, 16, 15),
                    child: Text(
                      post.title,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.red[400],
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  post.urlToImage != null ?  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: Hero(
                      tag: post.url,
                      child: Image.network(
                        post.urlToImage,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ): Container(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(17, 16, 0, 15),
                    child: Text(
                      'Fonte: ${post.source.name} - ${Format.dateDMY(post.publishedAt)}',
                      style: TextStyle(color: Colors.black38),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 15),
                    child: Text(
                      '${post.content.substring(
                          0, post.content.lastIndexOf(' ['))}continue lendo.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
