import 'dart:async';
import 'package:eprogrammingappflutter/Auth/login_screen.dart';
import 'package:eprogrammingappflutter/Dashboard/Dashboard.dart';
import 'package:eprogrammingappflutter/widget/Appcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Splash extends StatefulWidget {

  @override
  _SplashState createState() => _SplashState();
  static const String idScreen ="splash";

}

class _SplashState extends State<Splash> {
  String? finalEmail;


  @override
  void initState() {
    /*Timer(Duration(seconds: 15),(){
      Get.off(login());
    });*/
    // TODO: implement initState
    super.initState();
  }



  Future getValidationData() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainedEmail  = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail;
    });
    print(finalEmail);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Appbacground,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 70.0),
            child: Image.asset('assets/images/program.png',height: 230,width: 230,),

          ),
          Container(
            margin: const EdgeInsets.only(top: 80.0),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      "E-programming",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 34,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Text(
                    "Let's start with our new E-programming App.",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: InkWell(
                      onTap:(){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen()),);
                       // Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()),);
                        //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> finalEmail==null? login() :  Mainscreen()), (route) => false);
                      },

                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Center(
                          child: Text(
                            "Get started",
                            style: GoogleFonts.poppins(
                              color: AppColors.Appbacground,
                              fontSize: 16,
                            ),
                          ),

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );




  }
}


