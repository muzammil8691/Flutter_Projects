// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Chatting_App/authentication_screens/login_screen.dart';
import 'package:Chatting_App/home_page.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatefulWidget {
  String id = 'SignUp';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var userName_var;
  var eMail_var;
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange),
                  )
                ],
              ),
              SizedBox(height: 20),
              fullName(),
              SizedBox(height: 20),
              userName(),
              SizedBox(height: 20),
              eMail(),
              SizedBox(height: 20),
              password(),
              SizedBox(height: 20),
              submitButton(),
              SizedBox(height: 10),
              login(),
            ],
          ),
        ),
      ),
    );
  }

  Widget fullName() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(width: 2, color: Colors.deepOrange),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Full Name",
          border: InputBorder.none,
          prefixIcon:
              Icon(Icons.text_fields_outlined, color: Colors.deepOrange),
        ),
      ),
    );
  }

  Widget userName() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(width: 2, color: Colors.deepOrange),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        onChanged: (value) {
          userName_var = value;
        },
        controller: userNameController,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: "User Name",
          prefixIcon: Icon(Icons.person, color: Colors.deepOrange),
        ),
      ),
    );
  }

  Widget eMail() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(width: 2, color: Colors.deepOrange),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        onChanged: (value) {
          eMail_var = value;
        },
        controller: emailController,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: "E-Mail",
          prefixIcon: Icon(Icons.mail, color: Colors.deepOrange),
        ),
      ),
    );
  }

  Widget password() {
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
          labelText: "Password",
          prefixIcon: Icon(Icons.key, color: Colors.deepOrange),
        ),
      ),
    );
  }

  Widget submitButton() {
    return InkWell(
      onTap: () async {
        try {
          showLoadingDialog(context);
          if (eMail_var.toString().isNotEmpty &&
              password_var.toString().isNotEmpty) {
            await auth.createUserWithEmailAndPassword(
                email: eMail_var, password: password_var);

            Navigator.pop(context);
            Navigator.pushNamed(context, HomePage().id);
          } else {}
        } catch (e) {
          Navigator.pop(context);
          print(e);
          if (e is FirebaseAuthException) {
            if (e.code == 'email-already-in-use') {
              error = 'Email is already in use.';
            } else if (e.code == 'invalid-email') {
              error = 'Invalid email address.';
            } else if (e.code == 'weak-password') {
              error = 'Password must be larger than 6 Alphabets';
            } else {
              error = 'Some error occurred. Please try again later.';
            }
          } else {
            error = 'An unexpected error occurred.';
          }
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Center(
                  child: Text(
                'Some Error Occured!',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
              content: Text(error.toString()),
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
          "Register",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget login() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Have an Account?",
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, LoginScreen().id);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              "Login",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Creating Account, Please Wait"),
            content: LinearProgressIndicator(),
          );
        });
  }
}
