// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/weather_container.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  late TextEditingController searchBarController = TextEditingController();
  String apiKey = 'e8ca1b6a5bc454d87af81186910982bd';

  String? cityName;
  String? statusGlobal;
  String? cityGlobal;
  double? temperature;
  List<WeatherContainer> citiesWeatherList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff302F59),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff302F59),
        title: Text(
          "Current Weather",
          style: GoogleFonts.cabin(
            fontSize: 20,
            color: Colors.deepOrangeAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: searchBar(),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 5),
                itemCount: citiesWeatherList.length,
                itemBuilder: (context, index) {
                  return citiesWeatherList[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepOrangeAccent, width: 2),
        borderRadius: BorderRadius.circular(20),
        color: Color(0xff302F59),
      ),
      child: TextFormField(
        style: TextStyle(fontSize: 20),
        controller: searchBarController,
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 20, color: Colors.white54),
          border: InputBorder.none,
          hintText: "Enter City Here",
          prefixIcon: Icon(
            Icons.location_pin,
            size: 30,
            color: Color.fromARGB(255, 199, 31, 19),
          ),
          suffixIcon: InkWell(
            onTap: () async {
              print(citiesWeatherList.length);
              setState(() {
                cityName = searchBarController.text;
                getWeatherData(city: cityName.toString());
                searchBarController.clear();
              });
            },
            child: Icon(
              Icons.arrow_circle_right,
              size: 40,
              color: Colors.deepOrangeAccent,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getWeatherData({required String city}) async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey',
        ),
      );

      if (response.statusCode == 200) {
        print(response.body);

        String status = jsonDecode(response.body)["weather"][0]['main'];
        statusGlobal = status;
        temperature = jsonDecode(response.body)['main']['temp'];
        temperature = temperature! - 273;

        String cityAPI = jsonDecode(response.body)['name'];
        cityGlobal = cityAPI;

        String weatherCode = jsonDecode(response.body)["weather"][0]["icon"];

        print('temperature is:  $temperature');

        setState(() {
          citiesWeatherList.add(
            WeatherContainer(
              degree: temperature!.toStringAsFixed(0),
              cloud: getWeatherIcon(weatherCode),
              location: cityGlobal.toString(),
              status: statusGlobal.toString(),
            ),
          );
          print(status);
          print(cityAPI);
        });
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Icon getWeatherIcon(String weatherCode) {
    switch (weatherCode) {
      // Clear Sky (day)
      case '01d':
        return Icon(Icons.wb_sunny, size: 60, color: Colors.yellow);

      // Clear Sky (night)
      case '01n':
        return Icon(Icons.nightlight_round, size: 60, color: Colors.blueGrey);

      // Few Clouds (day)
      case '02d':
        return Icon(Icons.wb_cloudy, size: 60, color: Colors.blue);

      // Few Clouds (night)
      case '02n':
        return Icon(Icons.cloud_circle, size: 60, color: Colors.blueGrey);

      // Scattered Clouds
      case '03d':
      case '03n':
        return Icon(Icons.cloud, size: 60, color: Colors.blue);

      // Broken Clouds
      case '04d':
      case '04n':
        return Icon(Icons.cloud, size: 60, color: Colors.grey);

      // Shower Rain
      case '09d':
      case '09n':
        return Icon(Icons.cloudy_snowing, size: 60, color: Colors.blueAccent);

      // Rain
      case '10d':
      case '10n':
        return Icon(Icons.cloudy_snowing, size: 60, color: Colors.blueAccent);

      // Thunderstorm
      case '11d':
      case '11n':
        return Icon(Icons.flash_on, size: 60, color: Colors.red);

      // Snow
      case '13d':
      case '13n':
        return Icon(Icons.ac_unit, size: 60, color: Colors.lightBlue);

      // Mist or Fog
      case '50d':
      case '50n':
        return Icon(Icons.foggy, size: 60, color: Colors.grey);

      // Default Icon for unknown conditions
      default:
        return Icon(Icons.help_outline, size: 60, color: Colors.white);
    }
  }
}
