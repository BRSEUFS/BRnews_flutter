import 'package:flutter/material.dart';
import 'package:ovix/screens/notices_page.dart';


void main() {
  runApp(Ovix());
}

class Ovix extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      title: 'BR News',
      home: NoticesPage(),
    );
  }
}
