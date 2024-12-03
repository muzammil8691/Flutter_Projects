// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:weather_app/weather_2/weather.dart';
import 'package:weather_app/weather_2/hourly_forecast.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageTwo extends StatefulWidget {
  const HomePageTwo({super.key});

  @override
  State<HomePageTwo> createState() => _HomePageTwoState();
}

class _HomePageTwoState extends State<HomePageTwo> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xff302F59),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff302F59),
          title: Text(
            "Weather App",
            style: GoogleFonts.cabin(
              fontSize: 30,
              color: Colors.deepOrangeAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            unselectedLabelColor: Colors.white,
            labelColor: Colors.amber,
            indicatorColor: Colors.deepOrange,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: <Widget>[
              Tab(
                text: "Current Weather",
              ),
              Tab(
                text: "Hourly Forecast",
              ),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          WeatherApp(),
          HourlyForecast(),
        ]),
      ),
    );
  }
}
