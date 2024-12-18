import 'package:eprogrammingappflutter/c++quiz/cplusContoller.dart';
import 'package:eprogrammingappflutter/c++quiz/cplusquestion.dart';
import 'package:eprogrammingappflutter/flutterquiz/constants.dart';
import 'package:eprogrammingappflutter/python%20quiz/pythonQuestion.dart';
import 'package:eprogrammingappflutter/python%20quiz/pythonquizController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'option.dart';

class QuestioncCard extends StatelessWidget {


//  final Cplusquestion question;
  final Pythonquestion question;


  QuestioncCard({required this.question});

  @override
  Widget build(BuildContext context) {
    QuestionPythonController _controller = Get.put(QuestionPythonController());
    return SingleChildScrollView(
      child: Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
              children: [
                Text(
                  question.question!,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: kBlackColor),
                ),
                SizedBox(height: 12,),
                ...List.generate(
                  question.options!.length,
                      (index) => Option(
                    index: index,
                    text: question.options![index],
                    press: ()=> _controller.checkAns(question, index),
                  ),
                ),
              ])
      ),
    );
  }
}
