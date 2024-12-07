// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:Chatting_App/TabBar%20Screens/calls_screens.dart';
import 'package:Chatting_App/TabBar%20Screens/chats_screen.dart';
import 'package:Chatting_App/TabBar%20Screens/status_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: tabBarIndex,
      child: Scaffold(
        backgroundColor: Color(0xff006156),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff006156),
          title: Text(
            "Chatting App",
            style: TextStyle(
                fontSize: 25,
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            Icon(
              Icons.camera_alt_outlined,
              color: Colors.deepOrangeAccent,
            ),
            SizedBox(width: 20),
            Icon(
              Icons.search,
              color: Colors.deepOrangeAccent,
            ),
            SizedBox(width: 20),
            Icon(
              Icons.more_vert,
              color: Colors.deepOrangeAccent,
            ),
            SizedBox(width: 10),
          ],
          bottom: TabBar(
            indicatorColor: Colors.deepOrangeAccent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3,
            tabs: <Widget>[
              Text(
                "Chats",
                style: TextStyle(fontSize: 20, color: Colors.deepOrangeAccent),
              ),
              Text(
                "Updates",
                style: TextStyle(fontSize: 20, color: Colors.deepOrangeAccent),
              ),
              Text(
                "Calls",
                style: TextStyle(fontSize: 20, color: Colors.deepOrangeAccent),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ChatsScreen(),
            StatusScreen(),
            CallsScreen(),
          ],
        ),
      ),
    );
  }
}
