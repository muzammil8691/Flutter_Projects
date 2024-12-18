import 'package:eprogrammingappflutter/flutterquiz/constants.dart';
import 'package:eprogrammingappflutter/flutterquiz/controllers/question_controller.dart';
import 'package:eprogrammingappflutter/javaquiz/QuestionjavaController.dart';
import 'package:eprogrammingappflutter/javaquiz/javaprogress_bar.dart';
import 'package:eprogrammingappflutter/javaquiz/javaquestion_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class javaBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    QuestionjavaController _questionControllerjava = Get.put(QuestionjavaController());
    return Stack(
      children: [
        //SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: javaProgressBar(),
              ),
              SizedBox(height: kDefaultPadding),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                   // gradient: LinearGradient(colors: [Colors.cyan,Colors.cyan]),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Obx(
                            () => Text.rich(
                          TextSpan(
                            text:
                            "Question ${_questionControllerjava.questionNumber.value}",
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),
                            children: [
                              TextSpan(
                                  text: "/${_questionControllerjava.questions.length}",
                                  style: TextStyle(
                                      color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25
                                  )
                              ),
                            ],
                          ),
                        )
                    ),
                  ),
                ),
              ),
              Divider(thickness: 1.5),
              SizedBox(height: kDefaultPadding),
              Expanded(
                child: PageView.builder(
                  // Block swipe to next qn
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionControllerjava.pageController,
                  onPageChanged: _questionControllerjava.updateTheQnNum,
                  itemCount: _questionControllerjava.questions.length,
                  itemBuilder: (context, index) => javaQuestionCard(
                      question: _questionControllerjava.questions[index],),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
