import 'package:eprogrammingappflutter/flutterquiz/constants.dart';
import 'package:eprogrammingappflutter/flutterquiz/controllers/question_controller.dart';
import 'package:eprogrammingappflutter/flutterquiz/models/Questions.dart';
import 'package:eprogrammingappflutter/htmlquiz/Questionhtmlcontroller.dart';
import 'package:eprogrammingappflutter/htmlquiz/htmlquestion.dart';
import 'package:eprogrammingappflutter/javaquiz/Javaquestion.dart';
import 'package:eprogrammingappflutter/javaquiz/QuestionjavaController.dart';
import 'package:eprogrammingappflutter/widget/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'option.dart';

class QuestionCard extends StatelessWidget {


  final Htmlquestion question;

  QuestionCard({required this.question});

  @override
  Widget build(BuildContext context) {
    QuestionhtmlController _controller = Get.put(QuestionhtmlController());
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
