// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:banking_app/screenB.dart';
import 'package:banking_app/screenC.dart';
import 'package:banking_app/screenD.dart';
import 'package:banking_app/screena.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color selectedContainerColor = Color(0xff257C69);
  Color unselectedContainerColor = Color.fromARGB(216, 49, 158, 133);
  int selectedIndex = 0;

  List<Widget> screens = [ScreenA(), ScreenB(), ScreenC(), ScreenD()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCDF1E5),
      bottomNavigationBar: bottomnavbar(),
      body: screens[selectedIndex],
    );
  }

  Widget bottomnavbar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 78, 204, 171),
        borderRadius: BorderRadiusDirectional.circular(50),
      ),
      child: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 0,
        backgroundColor: Colors.transparent,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              decoration: BoxDecoration(
                color: selectedIndex == 0
                    ? selectedContainerColor
                    : unselectedContainerColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(Icons.home_outlined),
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              decoration: BoxDecoration(
                color: selectedIndex == 1
                    ? selectedContainerColor
                    : unselectedContainerColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(Icons.calendar_month_sharp),
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              decoration: BoxDecoration(
                color: selectedIndex == 2
                    ? selectedContainerColor
                    : unselectedContainerColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(Icons.add_task_sharp),
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              decoration: BoxDecoration(
                color: selectedIndex == 3
                    ? selectedContainerColor
                    : unselectedContainerColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(Icons.account_circle),
            ),
          ),
        ],
      ),
    );
  }

  //  Container
}
