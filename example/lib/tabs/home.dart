import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color(0xFFf8f8f8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Image.asset('assets/logo.png',width: 60,),
            ),
            Text('基于flutter的组件库，简洁、轻量、工具化',style: TextStyle(color: Color(0xFF8e8e8e))),
            
          ],
        ),
      )
    );
  }
}