import 'package:eprogrammingappflutter/flutterquiz/controllers/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/Appcolor.dart';
import '../constants.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold( backgroundColor:AppColors.Appbacground,
      appBar: AppBar(
        backgroundColor: AppColors.Appbacground,
        centerTitle: true,
        title:  Text( 'Flutter',style: TextStyle(color: Colors.white,fontSize: 20),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:40),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 70,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: CircleAvatar(
                          backgroundImage: ExactAssetImage('assets/images/program.png'),
                          radius: 30,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text('Flutter',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 26,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomLeft: Radius.circular(25)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                        offset: Offset(3.0, 3.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 40,),
            Icon(Icons.assignment_returned_rounded,size: 50,color: Colors.indigo,),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 300,
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),

                      child: Text(
                        "Flutter",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 26,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        " Score",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 26,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${_qnController.numOfCorrectAns * 10}/${_qnController.questions.length *10}",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                        ),),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                        offset: Offset(3.0, 3.0), // shadow direction: bottom right
                      )
                    ],
                    gradient: LinearGradient(colors: [Colors.indigo,Colors.indigo])
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
