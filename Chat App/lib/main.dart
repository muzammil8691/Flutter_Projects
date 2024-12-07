import 'package:flutter/material.dart';
import 'package:Chatting_App/Chats%20Open/chat_muzammil.dart';
import 'package:Chatting_App/TabBar%20Screens/calls_screens.dart';
import 'package:Chatting_App/TabBar%20Screens/chats_screen.dart';
import 'package:Chatting_App/TabBar%20Screens/status_screen.dart';
import 'package:Chatting_App/authentication_screens/landingPage.dart';
import 'package:Chatting_App/authentication_screens/login_screen.dart';
import 'package:Chatting_App/authentication_screens/signup_screen.dart';
import 'package:Chatting_App/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Chatting_App/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAC4j-MGeDVogzLdUOU7VuDCLlZKtc7-ew",
      appId: '1:803516310812:android:ab6139b1d2969af25fc6d9',
      messagingSenderId: "803516310812",
      projectId: "flash-chat-3ce7f",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(), // Show SplashScreen first
      routes: {
        SplashScreen().id: (context) => SplashScreen(),
        LandingPage().id: (context) => LandingPage(),
        SignUpScreen().id: (context) => SignUpScreen(),
        LoginScreen().id: (context) => LoginScreen(),
        HomePage().id: (context) => HomePage(),
        MuzammilChat().id: (context) => MuzammilChat(),
        ChatsScreen().id: (context) => ChatsScreen(),
        StatusScreen().id: (context) => StatusScreen(),
        CallsScreen().id: (context) => CallsScreen(),
      },
    );
  }
}
