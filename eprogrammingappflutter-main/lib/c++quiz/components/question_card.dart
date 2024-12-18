import 'package:eprogrammingappflutter/c++quiz/cplusContoller.dart';
import 'package:eprogrammingappflutter/c++quiz/cplusquestion.dart';
import 'package:eprogrammingappflutter/flutterquiz/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'option.dart';

class QuestioncCard extends StatelessWidget {


//  final Cplusquestion question;
  final Cplusquestion cquestion;


  QuestioncCard({required this.cquestion});

  @override
  Widget build(BuildContext context) {
    QuestioncplusController _controller = Get.put(QuestioncplusController());
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
                  cquestion.question!,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: kBlackColor),
                ),
                SizedBox(height: 12,),
                ...List.generate(
                  cquestion.options!.length,
                      (index) => Option(
                    index: index,
                    text: cquestion.options![index],
                    press: ()=> _controller.checkAns(cquestion, index),
                  ),
                ),
              ])
      ),
    );
  }
}
