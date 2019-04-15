import 'package:flutter/material.dart';
import 'package:ovix/models/noticeModel.dart';
import 'package:ovix/screens/notice_post_page.dart';
import 'package:ovix/util/utils.dart';

class CardLineNotice extends StatelessWidget {
  final NoticeModel notice;

  CardLineNotice({@required this.notice});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Container(
        margin: EdgeInsets.fromLTRB(4, 5, 4, 5),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            color: Colors.black38,
            blurRadius: 3.0,
          )]
        ),
        child:  GestureDetector(
          onTap: () {
            Route route = MaterialPageRoute(fullscreenDialog:  true ,builder: (context)=> NoticePostPage(post:  notice,) );
            Navigator.of(context).push(route);
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    width: 0.0,
                    color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white),
            child: notice.urlToImage != null
                ? SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 189.0,
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(5.0),
                        ),
                        child:  Hero(
                          tag: notice.url,
                          child: Image.network(notice.urlToImage , fit: BoxFit.cover, width: MediaQuery.of(context).size.width,
                            height: 115,),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                        width: MediaQuery.of(context).size.width,
                        height: 47,
                        child: Text(
                              notice.title.substring(
                                  0, notice.title.lastIndexOf(' - ')),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.red[400],
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              '${notice.source.name} - ${Format.dateDMY(notice.publishedAt)}',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
                : SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 100.0,
              child: Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 3.0),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                              notice.title.substring(
                                  0,
                                  notice.title.lastIndexOf(
                                    ' - ',
                                  )),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.red[500],
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(10, 0.0, 0.0, 10.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              '${notice.source.name} -  ${Format.dateDMY(notice.publishedAt)}',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
