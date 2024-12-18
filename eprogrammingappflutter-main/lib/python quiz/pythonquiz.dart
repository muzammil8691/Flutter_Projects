import 'package:eprogrammingappflutter/python%20quiz/components/body.dart';
import 'package:eprogrammingappflutter/python%20quiz/pythonquizController.dart';
import 'package:eprogrammingappflutter/widget/Appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Pythonquiz extends StatefulWidget {
  const Pythonquiz({Key? key}) : super(key: key);

  @override
  State<Pythonquiz> createState() => _PythonquizState();
}

class _PythonquizState extends State<Pythonquiz> {
  @override
  Widget build(BuildContext context) {
    QuestionPythonController _controller = Get.put(QuestionPythonController());
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

        body: pythonBody(),
      ),
    );
  }
}
