// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:bmi_calculator/calculate_bmi.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

enum Gender { male, female }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color unselectedColor = Color.fromARGB(224, 204, 34, 19);
  Color selectedColor = const Color.fromARGB(255, 46, 142, 49);
  var selectedGender;
  double weight = 50;
  double age = 18;

  double height = 110;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff252525),
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff252525),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 50)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              malecontainer(),
              femalecontainer(),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
          slider(),
          Padding(padding: EdgeInsets.only(top: 50)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              weightContainer(),
              ageContainer(),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 80)),
          calculateButton(),
        ],
      ),
    );
  }

  Widget malecontainer() {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        setState(() {
          selectedGender = Gender.male;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color:
              selectedGender == Gender.male ? selectedColor : unselectedColor,
          borderRadius: BorderRadius.circular(100),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset(
              'assets/images/Male.png',
              width: 100,
              height: 80,
            ),
            Text(
              "Male",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget femalecontainer() {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        setState(() {
          selectedGender = Gender.female;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color:
              selectedGender == Gender.female ? selectedColor : unselectedColor,
          borderRadius: BorderRadius.circular(100),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset(
              'assets/images/Female.png',
              width: 100,
              height: 80,
            ),
            Text(
              "Female",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget slider() {
    double heightInFeet = height / 30.48; // Convert cm to feet
    return Column(
      children: [
        Text(
          "Height in Cm's is : ${height.toStringAsFixed(0)} (${heightInFeet.toStringAsFixed(1)} Feet)",
          style: TextStyle(
              color: Colors.orange, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Slider(
          activeColor: Colors.red,
          value: height,
          onChanged: ((value) {
            setState(() {
              height = value;
            });
          }),
          min: 100,
          max: 200,
        ),
      ],
    );
  }

  Widget weightContainer() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        Row(
          children: [
            Text(
              "Weight in KG",
              style:
                  GoogleFonts.heebo(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  weight--;
                });
              },
              child: CircleAvatar(
                backgroundColor: Colors.red[700],
                child: Icon(Icons.exposure_minus_1, color: Colors.white),
              ),
            ),
            Container(
              width: 50,
              alignment: Alignment.center,
              child: Text(
                weight.toStringAsFixed(0),
                style: TextStyle(fontSize: 20),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  weight++;
                });
              },
              child: CircleAvatar(
                backgroundColor: Colors.green[900],
                child: Icon(Icons.exposure_plus_1, color: Colors.white),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Widget ageContainer() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Age in Years",
                style: GoogleFonts.heebo(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    age--;
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Colors.red[700],
                  child: Icon(Icons.exposure_minus_1, color: Colors.white),
                ),
              ),
              Container(
                width: 50,
                alignment: Alignment.center,
                child: Text(
                  age.toStringAsFixed(0),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    age++;
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Colors.green[900],
                  child: Icon(Icons.exposure_plus_1, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget calculateButton() {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Calculate calculator = Calculate(height: height, weight: weight);
        calculator.calculateBmi();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              bmi: calculator.calculateBmi(),
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.teal[700],
        ),
        child: Text(
          'Calculate BMI',
          style: GoogleFonts.aleo(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
