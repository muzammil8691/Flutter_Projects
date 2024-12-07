// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:Chatting_App/authentication_screens/login_screen.dart';
import 'package:Chatting_App/authentication_screens/signup_screen.dart';

class LandingPage extends StatefulWidget {
  LandingPage({super.key});
  String id = "LandingPage";

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff006156),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100),
              Text("Chatting App",
                  style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Times New Roman")),
              SizedBox(height: 50),
              Image.asset(
                'assets/logo.png', // Path to your image
                width: 250, // Size of the image
                height: 250,
                fit: BoxFit.cover, // Adjusts the image's fit
              ),
              SizedBox(height: 50),
              login(),
              SizedBox(height: 50),
              signUp(),
            ],
          ),
        ),
      ),
    );
  }

  Widget login() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, LoginScreen().id);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(width: 2, color: Colors.deepOrange),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget signUp() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SignUpScreen().id);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(width: 2, color: Colors.deepOrange),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SignUp",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
