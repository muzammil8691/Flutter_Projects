import 'package:eprogrammingappflutter/c++quiz/components/body.dart';
import 'package:eprogrammingappflutter/c++quiz/cplusContoller.dart';
import 'package:eprogrammingappflutter/widget/Appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CplusQuiz extends StatefulWidget {
  const CplusQuiz({Key? key}) : super(key: key);

  @override
  State<CplusQuiz> createState() => _CplusQuizState();
}

class _CplusQuizState extends State<CplusQuiz> {
  @override
  Widget build(BuildContext context) {
    QuestioncplusController _controller = Get.put(QuestioncplusController());
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

        body: cBody(),
      ),
    );
  }
}
