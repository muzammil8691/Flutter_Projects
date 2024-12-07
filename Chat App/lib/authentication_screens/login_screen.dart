// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Chatting_App/home_page.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  String id = 'Login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var email_var;
  var password_var;
  String? error;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff006156),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff006156),
          border: Border.all(width: 2, color: Colors.deepOrange),
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              userNameField(),
              SizedBox(height: 20),
              passwordField(),
              SizedBox(height: 20),
              loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget userNameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(width: 2, color: Colors.deepOrange),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        onChanged: (value) {
          email_var = value;
        },
        controller: emailController,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: "Enter E-Mail",
          prefixIcon: Icon(Icons.person, color: Colors.deepOrange),
        ),
      ),
    );
  }

  Widget passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(width: 2, color: Colors.deepOrange),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        onChanged: (value) {
          password_var = value;
        },
        controller: passwordController,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: "Enter Password",
          prefixIcon: Icon(Icons.key, color: Colors.deepOrange),
        ),
      ),
    );
  }

  Widget loginButton() {
    return InkWell(
      onTap: () async {
        try {
          showLoadingDialog(context);
          if (email_var.toString().isNotEmpty &&
              password_var.toString().isNotEmpty) {
            await auth.signInWithEmailAndPassword(
                email: email_var, password: password_var);

            Navigator.pop(context);

            Navigator.pushNamed(context, HomePage().id);
          } else {
            // Handle the case where either email or password is empty
          }
        } catch (e) {
          print(e);
          Navigator.pop(context);
          String errorMessage = 'An unexpected error occurred.';

          if (e is FirebaseAuthException) {
            if (e.code == 'user-not-found') {
              errorMessage = 'User not found. Please check your email.';
            } else if (e.code == 'wrong-password') {
              errorMessage = 'Incorrect password. Please try again.';
            } else if (e.code == 'invalid-email') {
              errorMessage = 'Invalid email address.';
            } else {
              errorMessage = 'Authentication failed. Please try again.';
            }
          }

          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Center(
                child: Text(
                  'Error',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              content: Text(errorMessage),
              backgroundColor: Color(0xff006156),
            ),
          );
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          "Login",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Logging in, Please Wait"),
            content: LinearProgressIndicator(),
            backgroundColor: Colors.deepOrange,
          );
        });
  }
}
