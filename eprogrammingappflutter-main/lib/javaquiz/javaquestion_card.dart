import 'package:eprogrammingappflutter/flutterquiz/constants.dart';
import 'package:eprogrammingappflutter/flutterquiz/controllers/question_controller.dart';
import 'package:eprogrammingappflutter/flutterquiz/models/Questions.dart';
import 'package:eprogrammingappflutter/javaquiz/Javaquestion.dart';
import 'package:eprogrammingappflutter/javaquiz/QuestionjavaController.dart';
import 'package:eprogrammingappflutter/javaquiz/javaoption.dart';
import 'package:eprogrammingappflutter/widget/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class javaQuestionCard extends StatelessWidget {


  final Javaquestion question;

  javaQuestionCard({required this.question});

  @override
  Widget build(BuildContext context) {
    QuestionjavaController _javacontroller = Get.put(QuestionjavaController());
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
                      (index) => javaOption(
                    index: index,
                    text: question.options![index],
                    press: ()=> _javacontroller.checkAns(question, index),
                  ),
                ),
              ])
      ),
    );
  }
}
