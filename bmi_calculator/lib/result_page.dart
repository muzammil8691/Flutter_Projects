// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ResultPage extends StatelessWidget {
  double bmi;
  ResultPage({required this.bmi});

  Color unselectedColor = Color.fromARGB(214, 194, 23, 7);
  Color selectedColor = Color.fromARGB(255, 29, 113, 36);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff252525),
        body: ListView(
          children: [
            SizedBox(height: 30),
            resuktTitle(),
            SizedBox(height: 30),
            bmiValue(),
            SizedBox(height: 30),
            rangeContainer(
              containerColor: bmi < 18.5 ? selectedColor : unselectedColor,
              rangetxt: "Less than 18 -- Underweight",
            ),
            rangeContainer(
              containerColor:
                  bmi >= 18.5 && bmi <= 23 ? selectedColor : unselectedColor,
              rangetxt: "18.5 - 23 -- Normal",
            ),
            rangeContainer(
              containerColor:
                  bmi >= 23 && bmi <= 25 ? selectedColor : unselectedColor,
              rangetxt: "23 - 25 Overweight--At Risk",
            ),
            rangeContainer(
              containerColor:
                  bmi >= 25 && bmi <= 30 ? selectedColor : unselectedColor,
              rangetxt: "25 - 30 Overweight--Moderately Obese",
            ),
            rangeContainer(
              containerColor: bmi > 30 ? selectedColor : unselectedColor,
              rangetxt: "Over 30 Overweight--Severly Obese",
            ),
          ],
        ));
  }

  Widget resuktTitle() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "Your BMI Score is",
        style: GoogleFonts.yuseiMagic(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget bmiValue() {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
        decoration: BoxDecoration(
          color: Color.fromARGB(185, 61, 61, 61),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.deepOrange, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              bmi.toStringAsFixed(1),
              style: GoogleFonts.yuseiMagic(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange),
            ),
            Text(
              " Kg/m2",
              style: GoogleFonts.yuseiMagic(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange),
            ),
          ],
        ));
  }

  Widget rangeContainer({String? rangetxt, Color? containerColor}) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        rangetxt.toString(),
        style: GoogleFonts.aBeeZee(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
