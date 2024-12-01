// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BitCoin extends StatefulWidget {
  const BitCoin({Key? key}) : super(key: key);

  @override
  State<BitCoin> createState() => _BitCoinState();
}

class _BitCoinState extends State<BitCoin> {
  String baseUrl =
      'https://bitcoinaverage-global-bitcoin-index-v1.p.rapidapi.com/indices/global/ticker/BTCUSD';

  Map<String, String> headers = {
    'X-RapidAPI-Key': 'a602063253msh56bdf3621eefa30p12b38cjsn6641fc2162b2',
    'X-RapidAPI-Host': 'bitcoinaverage-global-bitcoin-index-v1.p.rapidapi.com'
  };
  double? askingPrice;
  double? biddingPrice;
  double? lastTrade;
  double? hourPercentage;
  double? dayPercentage;
  double? weekPercentage;

  @override
  void initState() {
    super.initState();

    bitcoin();
    Timer.periodic(Duration(minutes: 1), (timer) {
      bitcoin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2c3e50),
      appBar: AppBar(
        backgroundColor: const Color(0xff2c3e50),
        leading: Icon(
          Icons.currency_bitcoin,
          size: 50,
          color: Colors.yellowAccent[700],
        ),
        title: Text(
          "Realtime BitCoin Price",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.yellowAccent[700],
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          SizedBox(height: 80),
          pricesContainer(),
          SizedBox(height: 50),
          percentageTitle(),
          SizedBox(height: 50),
          changePercentageRow(),
          SizedBox(height: 50),
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              setState(() {
                bitcoin();
              });
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 10),
                  Text(
                    "Refresh Stats",
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 217, 31, 18),
                    radius: 20,
                    child: Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> bitcoin() async {
    try {
      Uri uri = Uri.parse(baseUrl);
      final response = await http.get(uri, headers: headers);
      double ask = jsonDecode(response.body)['ask'];
      askingPrice = ask;
      double bid = jsonDecode(response.body)['bid'];
      biddingPrice = bid;
      double last = jsonDecode(response.body)['last'];
      lastTrade = last;
      double hour = jsonDecode(response.body)['changes']['percent']['hour'];
      hourPercentage = hour;
      double day = jsonDecode(response.body)['changes']['percent']['day'];
      dayPercentage = day;
      double week = jsonDecode(response.body)['changes']['percent']['week'];
      weekPercentage = week;

      setState(() {});

      if (response.statusCode == 200) {
        print(response.body);
        print(response.statusCode);
        print("value of ask is $ask");
      } else {
        print("Request failed with status: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Widget pricesContainer() {
    return Container(
      height: 150,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.yellow.withOpacity(0.8),
            spreadRadius: 5,
            blurRadius: 20,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Asking Price |",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.yellowAccent[700],
                  ),
                ),
                Text(
                  "Bidding Price |",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.yellowAccent[700],
                  ),
                ),
                Text(
                  "Last Trade",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.yellowAccent[700],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              askingPrice == null
                  ? Text(
                      "Loading...",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: const Color.fromARGB(255, 27, 82, 179),
                      ),
                    )
                  : Text(
                      "\$ ${askingPrice.toString()}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
              askingPrice == null
                  ? Text(
                      "Loading...",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: const Color.fromARGB(255, 27, 82, 179),
                      ),
                    )
                  : Text(
                      "\$ ${biddingPrice.toString()}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
              lastTrade == null
                  ? Text(
                      "Loading...",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: const Color.fromARGB(255, 27, 82, 179),
                      ),
                    )
                  : Text(
                      "\$ ${lastTrade.toString()} ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }

  Widget percentageTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Price Changes in Percentage",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.yellowAccent[700],
          ),
        ),
      ],
    );
  }

  Widget changePercentageRow() {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 115,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.yellow.withOpacity(0.8),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  "This Hour",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                hourPercentage == null
                    ? Text("Loading...")
                    : Text(
                        hourPercentage.toString(),
                        style: TextStyle(
                          color:
                              hourPercentage! >= 0 ? Colors.green : Colors.red,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ],
            ),
          ),
          Container(
            width: 115,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.yellow.withOpacity(0.8),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  "This Day",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                dayPercentage == null
                    ? Text("Loading...")
                    : Text(
                        dayPercentage.toString(),
                        style: TextStyle(
                          color:
                              dayPercentage! >= 0 ? Colors.green : Colors.red,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ],
            ),
          ),
          Container(
            width: 115,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.yellow.withOpacity(0.8),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  "This Week",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                weekPercentage == null
                    ? Text("Loading...")
                    : Text(
                        weekPercentage.toString(),
                        style: TextStyle(
                          color:
                              weekPercentage! >= 0 ? Colors.green : Colors.red,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
