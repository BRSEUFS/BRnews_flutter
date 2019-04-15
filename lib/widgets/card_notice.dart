import 'package:flutter/material.dart';
import 'package:ovix/models/noticeModel.dart';

class CardNotice extends StatelessWidget {
  final NoticeModel notice;

  CardNotice({@required this.notice});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child:  GestureDetector(
        onTap: (){
          print('Ok');
        },
        child:  Container(
          decoration: UnderlineTabIndicator(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Image.network(
                    notice.urlToImage != null
                        ? notice.urlToImage
                        : 'https://nutribulletbrasil.vteximg.com.br/arquivos/sem-foto.gif?v=635825126906770000',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 125),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(right: 10.0, left: 10.0, top: 7.5, bottom: 5.5),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                            bottom: 4.0,
                          ),
                          child: Row(
                            children: <Widget>[
                              Text(
                                notice.source.name,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                softWrap: true,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                      ),
                      Text(
                        notice.title,
                        maxLines: 2,
                        softWrap: true,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
