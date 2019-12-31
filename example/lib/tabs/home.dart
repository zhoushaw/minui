import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List mList = new List();

  @override
  void initState() {
    super.initState();
    mList.add(1);
    mList.add(2);
    mList.add(2);
  }



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
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text('基于flutter的组件库，简洁、轻量、工具化',style: TextStyle(color: Color(0xFF8e8e8e)))
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 300
              ),
              child: ExpansionPanelList(
                expansionCallback: (index,bol){
                  //调用内部方法
                  // _setCurrentIndex(index, bol);
                },
                children: mList.map((index){
                    //返回一个组成的ExpansionPanel
                    return ExpansionPanel(
                      headerBuilder: (context,isExpanded){  
                        return ListTile(
                          title: Text('This is No.$index'),
                        );
                      },
                      body: ListTile(
                        title: Text('expansion no.$index'),
                      ),
                      isExpanded: true
                    );
                }).toList()
              )
            )
          ],
        ),
      )
    );
  }
}