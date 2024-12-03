import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HourlyForecast extends StatefulWidget {
  const HourlyForecast({super.key});

  @override
  State<HourlyForecast> createState() => _HourlyForecastState();
}

class _HourlyForecastState extends State<HourlyForecast> {
  List<String> times = [
    "12 AM",
    "1 AM",
    "2 AM",
    "3 AM",
    "4 AM",
    "5 AM",
    "6 AM",
    "7 AM",
    "8 AM",
    "9 AM"
  ];

  // Generate temperatures starting from 19 and decreasing by 2
  List<int> temperatures = List.generate(10, (index) => 19 - (index * 2));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff302F59),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff302F59),
        title: Text(
          "Hourly Weather",
          style: GoogleFonts.cabin(
            fontSize: 20,
            color: Colors.deepOrangeAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(30),
        children: [
          const SizedBox(height: 20),

          // Add a horizontally scrollable view
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                times.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: hoursRow(times[index], temperatures[index]),
                ),
              ),
            ),
          ),
          const SizedBox(height: 70),
          airQuality(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget hoursRow(String time, int temperature) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white24,
        border: Border.all(width: 2, color: Colors.deepOrangeAccent),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(time, style: const TextStyle(color: Colors.deepOrangeAccent)),
          const SizedBox(height: 10),
          const Icon(
            Icons.cloud,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          Text(
            "$temperature°C",
            style: const TextStyle(color: Colors.deepOrangeAccent),
          ),
        ],
      ),
    );
  }

  Widget airQuality() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white30,
        border: Border.all(color: Colors.deepOrangeAccent, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "AIR QUALITY",
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 20),
          const Text(
            "3-low Health Risk",
            style: TextStyle(color: Colors.white70),
          ),
          Slider(
            activeColor: Colors.pinkAccent[100],
            value: 3,
            onChanged: (value) {
              setState(() {});
            },
            min: 0,
            max: 10,
          ),
          SizedBox(height: 5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "See More",
                style: TextStyle(color: Colors.white70),
              ),
              Icon(
                Icons.arrow_right,
                color: Colors.white70,
              ),
            ],
          )
        ],
      ),
    );
  }
}
