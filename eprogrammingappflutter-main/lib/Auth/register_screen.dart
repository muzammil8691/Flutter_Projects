
import 'package:eprogrammingappflutter/Auth/helper_function.dart';
import 'package:eprogrammingappflutter/Auth/login_screen.dart';
import 'package:eprogrammingappflutter/widget/Appcolor.dart';
import 'package:eprogrammingappflutter/widget/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import '../widget/constant.dart';
import './services/auth_services.dart';

enum SelectCategory {
  // ignore: constant_identifier_names
  Student,
  // ignore: constant_identifier_names
  Admin,
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isloading = false;
  final formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String fullName = '';
  String phone = '';
  SelectCategory? _category = SelectCategory.Student;
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                              child: Lottie.asset('assets/images/anim.json'),
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
                                labelText: "Full Name",

                                prefixIcon: Icon(
                                  Icons.person,
                                  color:AppColors.Appbacground,
                                ),
                              ),
                              onChanged: (val) {
                                setState(() {
                                  fullName = val;
                                });
                              },
                              validator: (val) {
                                if (val!.isNotEmpty) {
                                  return null;
                                } else {
                                  return "Name cannot be empty";
                                }
                              }),
                          const SizedBox(
                            height: 15.0,
                          ),
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
                                return "Password must be at least 6 characters";
                              } else {
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
                            height: 15,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: textinputDecoration.copyWith(
                              labelText: "Phone",
                              prefixIcon: Icon(
                                Icons.phone,
                                color:AppColors.Appbacground,
                              ),
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Phone number is required";
                              }
                              else if (val.contains('@#!%^&*()abcbefghigklmnopqrst')) {
                                return "enter valid phone number";
                              } else if (val.length>11) {
                                return "enter valid phone number";
                              }
                              else {
                                return null;
                              }
                            },
                            onChanged: (val) {
                              setState(() {
                                phone = val;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          ListTile(
                            title: const Text('Student'),
                            leading: Radio<SelectCategory>(
                              value: SelectCategory.Student,
                              groupValue: _category,
                              fillColor: MaterialStateProperty.all(blue,
                              ),
                              onChanged: (SelectCategory? value) {
                                setState(() {
                                  _category = value;
                                });
                              },
                            ),
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
                                "Register",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              onPressed: () {
                                register();
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text.rich(
                            TextSpan(
                                text: "Already have an account? ",
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Login now",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => nextScreen(
                                        context,
                                        const LogInScreen(),
                                      ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
    );
  }

  register() async {
    if (formkey.currentState!.validate()) {
      setState(() {
        _isloading = true;
      });
    }
    String category = _category.toString().split('.').last;
    await authServices
        .regiseterUser(fullName, email, password, phone,category)
        .then((value) async {
      if (value == true) {
        await HelperFunction.saveUserLoggedInStatus(true);
        await HelperFunction.saveUserEmail(email);
        await HelperFunction.saveUserNameSp(fullName);
        // ignore: use_build_context_synchronously
        if (FirebaseAuth.instance.currentUser!.emailVerified) {
          // ignore: use_build_context_synchronously
          nextScreenReplace(context, const LogInScreen());
          Fluttertoast.showToast(msg: "Register Succesfully");
        } else {
          // ignore: use_build_context_synchronously
          /*nextScreen(
            context,
            const VerifyEmail(),
          );*/
          nextScreenReplace(context, const LogInScreen());
          Fluttertoast.showToast(msg: "Register Succesfully");
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
