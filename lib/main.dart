import 'package:flutter/material.dart';
import 'package:flutter_tab_bar_navigation/FirstPage.dart';

import 'SecondPage.dart';
import 'ThirdPage.dart';

void main() => runApp(new MaterialApp(
      home: MyTabs(),
    ));

class MyTabs extends StatefulWidget {
  @override
  _MyTabsState createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  TabController tabController;
  TabController bottomController;


  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
    bottomController = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    bottomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pages'),
        backgroundColor: Colors.deepOrange,
        bottom: TabBar(controller: tabController, tabs: <Tab>[
          Tab(icon: Icon(Icons.arrow_forward)),
          Tab(icon: Icon(Icons.arrow_downward)),
          Tab(icon: Icon(Icons.arrow_back)),
        ]),
      ),
      body: new TabBarView(controller: tabController, children: <Widget>[
        new First(),
        new Second(),
        new Third(),
      ]),
      bottomNavigationBar: new Material(
        color: Colors.green,
        child: new TabBar(controller: bottomController, tabs: <Tab>[
          Tab(icon: Icon(Icons.arrow_forward)),
          Tab(icon: Icon(Icons.arrow_downward)),
          Tab(icon: Icon(Icons.arrow_back)),
        ]),
      ),
    );
  }
}
