import 'package:eprogrammingappflutter/javaquiz/QuestionjavaController.dart';
import 'package:eprogrammingappflutter/javaquiz/javabody.dart';
import 'package:eprogrammingappflutter/widget/Appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class javaquiz extends StatelessWidget {
  const javaquiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionjavaController _controller = Get.put(QuestionjavaController());
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

        body: javaBody(),
      ),
    );
  }
}
