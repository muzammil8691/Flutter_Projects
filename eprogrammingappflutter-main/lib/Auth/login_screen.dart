// ignore_for_file: use_build_context_synchronously

import 'dart:developer';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eprogrammingappflutter/Admin/Admin_Dashboard.dart';
import 'package:eprogrammingappflutter/Auth/helper_function.dart';
import 'package:eprogrammingappflutter/Auth/register_screen.dart';
import 'package:eprogrammingappflutter/Auth/services/auth_services.dart';
import 'package:eprogrammingappflutter/Auth/usermodel.dart';
import 'package:eprogrammingappflutter/Dashboard/Dashboard.dart';
import 'package:eprogrammingappflutter/widget/Appcolor.dart';
import 'package:eprogrammingappflutter/widget/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool _isloading = false;
  String role = '';
  String name = '';
  String accountcategory = '';
  AuthServices authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isloading
          ? Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor),
            )
          : SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Container(
                      // Here the height of the container is 45% of our total height
                      height:290,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.Appbacground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.elliptical(90,50),
                          bottomRight: Radius.elliptical(90,50),
                        ),
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 230,
                              height: 230,
                              child: Image.asset('assets/images/program.png'),
                            )
                          ],
                        ),
                      ),

                    ),
                    SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 12, 30, 8),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: textinputDecoration.copyWith(
                              labelText: "Email",
                              prefixIcon: Icon(
                                Icons.email,
                                color:AppColors.Appbacground,
                              ),
                            ),
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                            validator: (val) {
                              return RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(val!)
                                  ? null
                                  : "Please enter a valid email";
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: textinputDecoration.copyWith(
                              labelText: "Password",
                              prefixIcon: Icon(
                                Icons.lock,
                                color:AppColors.Appbacground,
                              ),
                            ),
                            validator: (val) {

                              if (val!.length < 6) {
                                return RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(val)
                                    ? null
                                    : "Please enter a valid passward with Regular Expression";
                              }
                              else {
                                return null;
                              }
                            },
                            onChanged: (val) {
                              setState(() {
                                password = val;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary:  AppColors.Appbacground,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              onPressed: () {
                                login();
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text.rich(
                            TextSpan(
                                text: "Don't have an account? ",
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "Register here",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => nextScreen(
                                            context, const RegisterScreen())),
                                ]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: (){
                             // Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()),);
                            },
                              child: Text("Forget Password")),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
    );
  }
  login() async {
    if (formkey.currentState!.validate()) {
      setState(() {
        _isloading = true;
      });
    }
    await authServices.loginUser(email, password).then((value) async {
      if (value == true) {
        final firebaseuser = FirebaseAuth.instance.currentUser!.uid;

        if (firebaseuser != null) {
          await FirebaseFirestore.instance
              .collection("users")
              .doc(firebaseuser)
              .get()
              .then((value) {
            UserModel userModel =
            UserModel.fromMap(value.data() as Map<String, dynamic>);

            role = userModel.category.toString();
            name = userModel.fullName.toString();
          });
        }
        await HelperFunction.saveUserLoggedInStatus(true);
        await HelperFunction.saveUserEmail(email);
        await HelperFunction.saveUserNameSp(name);
        if (role == 'Admin') {
          nextScreenReplace(context, const Admin_Dashboard());

        } else {
          if (FirebaseAuth.instance.currentUser!.emailVerified) {
            final firebaseuser = FirebaseAuth.instance.currentUser!.uid;
            await FirebaseFirestore.instance
                .collection("users")
                .doc(firebaseuser)
                .get()
                .then((value) {
              if (value['category'] == "student") {
                nextScreenReplace(context, const Dashboard());
              } else {
                nextScreenReplace(context, const Dashboard());
              }
            });
          } else {
            nextScreen(
              context,
              //const VerifyEmail(),
              const Dashboard(),
              // const NavBarScreen(),
            );
          }
        }
      } else {
        showSnakBar(context, Colors.red, value);
        setState(() {
          _isloading = false;
        });
      }
    });


  }



}
