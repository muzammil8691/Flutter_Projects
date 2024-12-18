import 'package:eprogrammingappflutter/c++quiz/cplusContoller.dart';
import 'package:eprogrammingappflutter/flutterquiz/constants.dart';
import 'package:eprogrammingappflutter/python%20quiz/pythonquizController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'progress_bar.dart';
import 'question_card.dart';

class pythonBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    QuestionPythonController _questionControllerj = Get.put(QuestionPythonController());
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
                child: ProgressBar(),
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
                            "Question ${_questionControllerj.questionNumber.value}",
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),
                            children: [
                              TextSpan(
                                  text: "/${_questionControllerj.questions.length}",
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
                  controller: _questionControllerj.pageController,
                  onPageChanged: _questionControllerj.updateTheQnNum,
                  itemCount: _questionControllerj.questions.length,
                  itemBuilder: (context, index) => QuestioncCard(
                    question: _questionControllerj.questions[index],),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
