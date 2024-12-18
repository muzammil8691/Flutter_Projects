import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eprogrammingappflutter/Model/db.dart';
import 'package:eprogrammingappflutter/Screens/tutorial_screen.dart';
import 'package:eprogrammingappflutter/c++quiz/cplusquiz.dart';
import 'package:eprogrammingappflutter/cssquiz/cssquiz.dart';
import 'package:eprogrammingappflutter/database_helper/database_helper.dart';
import 'package:eprogrammingappflutter/flutterquiz/quiz/quiz_screen.dart';
import 'package:eprogrammingappflutter/htmlquiz/htmlquiz.dart';
import 'package:eprogrammingappflutter/javaquiz/javaquiz.dart';
import 'package:eprogrammingappflutter/paid_course.dart';
import 'package:eprogrammingappflutter/python%20quiz/pythonquiz.dart';
import 'package:eprogrammingappflutter/widget/Appcolor.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SubDashBoard extends StatefulWidget {
   String name;
   int categoryid;


   SubDashBoard({required this.name, required this.categoryid});

  @override
  State<SubDashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<SubDashBoard> {
    @override
    Widget build(BuildContext context) {
      var size = MediaQuery
          .of(context)
          .size;
      return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                // Here the height of the container is 45% of our total height
                height: size.height * .50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      AppColors.Appbacground,
                      AppColors.Buttoncolor,
                    ],
                  ),
                  /*image: DecorationImage(
                      image: AssetImage('assets/images/Dashboard/gradient.png'),
                      fit: BoxFit.cover)*/

                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                  child: Lottie.asset('assets/images/anim.json'),
                ),
              ),

              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * .35,
                      width: 10,
                    ),
                    Container(
                      height: size.height * .60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: AppColors.dashbackDOWN,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 15,),
                            Expanded(
                              child: GridView.count(
                                /*  crossAxisCount: 2,
                                childAspectRatio: 1.2,
                                crossAxisSpacing: 1,
                                mainAxisSpacing: 1,*/
                                crossAxisCount: 2,
                                //childAspectRatio: (itemWidth / itemHeight),
                                childAspectRatio: 0.90,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                padding: const EdgeInsets.all(30),
                                children: <Widget>[

                                  Container(
                                    // padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: MaterialButton(
                                      onPressed: () {
                                        //Get.to(QuizScreen());
                                        navigateToNewScreen(
                                            context, widget.categoryid,
                                            widget.name);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(
                                                  8.0),
                                              child: Image.asset(
                                                  "assets/images/theory.png"),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(
                                                  8.0),
                                              child: Column(
                                                children: [
                                                  Text("Theory",
                                                    style: GoogleFonts.poppins(
                                                      fontWeight: FontWeight
                                                          .w700,
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: MaterialButton(onPressed: () {
                                      if (widget.name == 'Flutter') {
                                        Get.to(QuizScreen());
                                        //Get.to(javaquiz());
                                      }
                                      else if (widget.name == 'Java') {
                                        Get.to(javaquiz());
                                      }
                                      else if (widget.name == 'HTML') {
                                        Get.to(htmlquiz());
                                      }
                                      else if (widget.name == 'CSS') {
                                        Get.to(Cssquiz());
                                      }
                                      else if (widget.name == 'C++') {
                                        Get.to(CplusQuiz());
                                      }
                                      else if (widget.name == 'Python') {
                                        Get.to(Pythonquiz());
                                      }


                                      //Get.to(SubDashBoard());
                                    },
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(
                                                  12.0),
                                              child: Image.asset(
                                                  "assets/images/quiz.png"),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(
                                                  8.0),
                                              child: Column(
                                                children: [
                                                  Text("Quiz",
                                                    style: GoogleFonts.poppins(
                                                      fontWeight: FontWeight
                                                          .w700,
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  /* Container(
                                  // padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: MaterialButton(onPressed: () {
                                    //Get.to(QuizScreen());
                                    Get.to(SubDashBoard());
                                  },
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Image.asset("assets/images/video.png"),
                                          ),
                                          SizedBox(width: 20,),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Text("Tutorials",
                                                  style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ),*/
                                  Container(
                                    // padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: MaterialButton(onPressed: () {
                                      Get.to(Paid_Course(name: widget.name,));
                                      //Get.to(SubDashBoard());
                                    },
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(
                                                  12.0),
                                              child: Image.asset(
                                                  "assets/images/social.png"),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(
                                                  8.0),
                                              child: Column(
                                                children: [
                                                  Text("PaidCourse",
                                                    style: GoogleFonts.poppins(
                                                      fontWeight: FontWeight
                                                          .w700,
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),


                                ],
                              ),
                            ),
                            //Image.asset('assets/images/Dashboard/bottom.png'),


                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      );
    }

    void navigateToNewScreen(BuildContext context, int category,
        String name) async {
      // Retrieve tutorials from the database
      List<Tutorial> tutorials = await DatabaseHelper().getTutorials(
          widget.categoryid);
      // Navigate to the TutorialScreen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              TutorialScreen(
                name: widget.name.toString(), categoryid: widget.categoryid,),
          settings: RouteSettings(
            arguments: {
              'tutorials': tutorials,
              'category': category,
            },
          ),
        ),
      );
    }
  }

