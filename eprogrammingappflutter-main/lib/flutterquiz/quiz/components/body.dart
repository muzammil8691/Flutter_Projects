import 'package:eprogrammingappflutter/flutterquiz/constants.dart';
import 'package:eprogrammingappflutter/flutterquiz/controllers/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'progress_bar.dart';
import 'question_card.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    QuestionController _questionController = Get.put(QuestionController());
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
                            "Question ${_questionController.questionNumber.value}",
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),
                            children: [
                              TextSpan(
                                  text: "/${_questionController.questions.length}",
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
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQnNum,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                      question: _questionController.questions[index],),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
