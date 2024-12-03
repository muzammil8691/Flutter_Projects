// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherContainer extends StatelessWidget {
  String degree;
  Widget cloud;
  String location;
  String status;
  WeatherContainer(
      {required this.degree,
      required this.cloud,
      required this.location,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 180,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xff47309C),
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              colors: [Color(0xff3b2c8b), Color(0xff4f32a7)],
              stops: [0.35, 0.40],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$degree°',
                    style: GoogleFonts.b612Mono(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  cloud,
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    location.toString(),
                    style: GoogleFonts.b612Mono(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    status.toString(),
                    style: GoogleFonts.b612Mono(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
