import 'package:eprogrammingappflutter/flutterquiz/constants.dart';
import 'package:eprogrammingappflutter/flutterquiz/controllers/question_controller.dart';
import 'package:eprogrammingappflutter/htmlquiz/Questionhtmlcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';


class ProgressBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF3F4768), width: 3),
          borderRadius: BorderRadius.circular(50),
        ),
        child: GetBuilder<QuestionhtmlController>(
            init: QuestionhtmlController(),
            builder: (contoller) {
              return Stack(
                children: [
                  // LayoutBuilder provide us the available space for the conatiner
                  // constraints.maxWidth needed for our animation
                  LayoutBuilder(
                    builder: (context, constraints) => Container(
                      // from 0 to 1 it takes 60s
                      width: constraints.maxWidth * contoller.animation!.value,
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding / 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${(contoller.animation!.value*20).round()} sec",style: TextStyle(color: Colors.white),),
                          Icon(Icons.access_time,color: Colors.white,)
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
        )
    );
  }
}
