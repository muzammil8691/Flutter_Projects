import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Chatting_App/authentication_screens/landingPage.dart'; // Make sure this is imported

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  final String id = 'SplashScreen'; // Define the route ID

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    timer(); // Trigger timer to navigate after delay
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff006156),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Chatting App", // Modify the text as per your app
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.orange[800],
              ),
            ),
          ),
          Center(
            child: Image.asset(
              'assets/logo.png', // Path to your image
              width: 250, // Size of the image
              height: 250,
              fit: BoxFit.cover, // Adjusts the image's fit
            ),
          ),
        ],
      ),
    );
  }

  // Timer to navigate to the next screen after 2 seconds
  Future timer() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LandingPage()),
    );
  }
}
