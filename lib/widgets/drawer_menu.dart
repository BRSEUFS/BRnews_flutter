import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ovix/screens/map_page.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 70.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x000000), Color(0xff0000)],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight,
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: 80,
                      height: 70,
                      child: Icon(
                        FontAwesomeIcons.userCircle,
                        size: 50,
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  width: 170.0,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'Acesse sua conta',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: <Widget>[Text('ou cadastre-se')],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 54,
                  child: Icon(
                    FontAwesomeIcons.signInAlt,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 8.0,
          ),
          ListTile(
            trailing: Icon(Icons.arrow_right),
            title: Text(
              'News',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
          ),
//          ListTile(
//            trailing: Icon(Icons.arrow_right),
//            title: Text(
//              'Ciência',
//              style: TextStyle(
//                fontSize: 20.0,
//                fontWeight: FontWeight.w400,
//                color: Colors.black87,
//              ),
//            ),
//          ),
//          ListTile(
//            trailing: Icon(Icons.arrow_right),
//            title: Text(
//              'Econômia',
//              style: TextStyle(
//                fontSize: 20.0,
//                fontWeight: FontWeight.w400,
//                color: Colors.black87,
//              ),
//            ),
//          ),
//          ListTile(
//            trailing: Icon(Icons.arrow_right),
//            title: Text(
//              'Entertenimento',
//              style: TextStyle(
//                fontSize: 20.0,
//                fontWeight: FontWeight.w400,
//                color: Colors.black87,
//              ),
//            ),
//          ),
//          ListTile(
//            trailing: Icon(Icons.arrow_right),
//            title: Text(
//              'Esporte',
//              style: TextStyle(
//                fontSize: 20.0,
//                fontWeight: FontWeight.w400,
//                color: Colors.black87,
//              ),
//            ),
//          ),
//          ListTile(
//            trailing: Icon(Icons.arrow_right),
//            title: Text(
//              'Geral',
//              style: TextStyle(
//                fontSize: 20.0,
//                fontWeight: FontWeight.w400,
//                color: Colors.black87,
//              ),
//            ),
//          ),
//          ListTile(
//            trailing: Icon(Icons.arrow_right),
//            title: Text(
//              'Saúde',
//              style: TextStyle(
//                fontSize: 20.0,
//                fontWeight: FontWeight.w400,
//                color: Colors.black87,
//              ),
//            ),
//          ),
//
//          GestureDetector(
//            child: ListTile(
//              trailing: Icon(Icons.map),
//              title: Text(
//                'Maps',
//                style: TextStyle(
//                  fontSize: 20.0,
//                  fontWeight: FontWeight.w400,
//                  color: Colors.black87,
//                ),
//              ),
//            ),
//            onTap: (){
//             var map = MaterialPageRoute(builder: (context) => MapSample());
//              Navigator.push(context, map );
//            },
//          ),
        ],
      ),
    );
  }
}
