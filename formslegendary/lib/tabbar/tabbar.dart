import 'package:flutter/material.dart';
import 'package:formslegendary/login/login.dart';
import 'package:formslegendary/screen1/demo.dart';
class tabBar extends StatefulWidget {

  @override
  State<tabBar> createState(){ return _tabBarState();}
}

class _tabBarState extends State<tabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView( 
        children:[
          Demo(),
          Login()
        ]),
        bottomNavigationBar:
        Container(
          color: Colors.cyan,
          child:TabBar(
          indicatorColor: Colors.amber,
          tabs : [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.account_circle)),
          ]
        ), 
        ) 
      ),
    );
  }
}