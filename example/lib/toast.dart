import 'package:flutter/material.dart';

class Toast extends StatefulWidget {
  Toast({Key key}) : super(key: key);

  @override
  _ToastState createState() => _ToastState();
}

class _ToastState extends State<Toast> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('1'),
    );
  }
}