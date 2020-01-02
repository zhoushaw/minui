import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List comps = new List();
  @override
  void initState() {
    super.initState();
    comps = [
      {
        "title": '布局元素',
        "leading": Icon(Icons.toll),
        "child": [
          {"title": '待补充....',"route": ""}
        ],
        "isExpanded": false
      },
      {
        "title": '基础原件',
        "leading": Icon(Icons.code),
        "child": [
          {"title": 'toast',"route": "toast"}
        ],
        "isExpanded": false
      },
      {
        "title": '功能组件',
        "leading": Icon(Icons.send),
        "child": [
          {"title": 'toast',"route": "toast"}
        ],
        "isExpanded": false
      },
      {
        "title": '提示反馈',
        "leading": Icon(Icons.info),
        "child": [
          {"title": 'toast',"route": "toast"}
        ],
        "isExpanded": true
      },
    ];
  }

  Widget getListTile(item) {
      return ListTile(
        title: Text(item['title'])
      );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
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
                  if (comps[index]["isExpanded"]==true&&bol) return;
                  //调用内部方法
                  setState(() {
                    var i = 0;
                    // 其他展开全部关闭
                    comps.forEach((item){
                      if (i!=index) comps[i]["isExpanded"] = false;
                      i = i+1;
                    });
                    comps[index]["isExpanded"] = !bol;
                  });
                },
                children: comps.map((item){
                    //返回一个组成的ExpansionPanel
                    return ExpansionPanel(
                      headerBuilder: (context,isExpanded){  
                        return ListTile(
                          leading: item['leading'],
                          title: Text(item['title'])
                        );
                      },
                      body: Container(
                        child: Column(
                          children:  List<Widget>.from(item['child'].map((child){
                            return Container(
                              decoration: BoxDecoration(
                                border: Border(top: BorderSide(width: 1,color: Color(0xFFedebeb)))
                              ),
                              child: GestureDetector(
                                onTap: (){
                                  if (child['route']=='') return;
                                  Navigator.pushNamed(context, child['route']);
                                },
                                child: ListTile(
                                  title: Text(child['title'])
                                ),
                              ),
                            );
                          }))
                        ),
                      ),
                      isExpanded: item["isExpanded"],
                      canTapOnHeader: true
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