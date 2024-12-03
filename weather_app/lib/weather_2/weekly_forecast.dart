import 'package:flutter/material.dart';

class WeeklyForecast extends StatefulWidget {
  const WeeklyForecast({super.key});

  @override
  State<WeeklyForecast> createState() => _WeeklyForecastState();
}

class _WeeklyForecastState extends State<WeeklyForecast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff492E85),
    );
  }
}
