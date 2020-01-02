import 'package:flutter/material.dart';
import './tabs/home.dart';
import './tabs/about.dart';
import './toast.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MinUI',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      routes: {
        'toast': (context)=>Toast()
      },
      home: MyHomePage(title: 'MinUI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  TabController controller;
  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title,style: TextStyle(fontWeight: FontWeight.w600))),
      ),
      body: TabBarView(
        children: <Widget>[Home(),About()],
        controller: controller
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          tabs: <Tab>[
            Tab(
              icon: Image.asset('assets/cube.png',height: 25,),
              text: '组件库'
            ),
            Tab(
              icon: Icon(Icons.build,color: Color(0xFF29b1b1),),
              text: '关于'
            ),
          ],
          controller: controller
        ),
      ),
    );
  }
}
