import 'package:eprogrammingappflutter/flutterquiz/controllers/question_controller.dart';
import 'package:eprogrammingappflutter/widget/Appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/bgg.png"),
            fit: BoxFit.fill,
          )
      ),
      child: Scaffold(backgroundColor: AppColors.Appbacground,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          //Fluttter show the back button automatically
          backgroundColor: AppColors.Appbacground,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: _controller.nextQuestion,child: Text("Next",style: TextStyle(
                  fontSize: 20,
                  color: Colors.white),)),
            ),
          ],

        ),

        body: Body(),
      ),
    );
  }
}
