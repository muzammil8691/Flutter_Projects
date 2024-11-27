import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCDF1E5),
      body: Column(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Transaction History",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
          ),
          SizedBox(height: 20),
          // Add the transaction graph (fl_chart)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                  border: BorderDirectional(
                      bottom: BorderSide(color: Colors.black))),
              height: 250,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  minX: 0,
                  maxX: 6,
                  minY: 0,
                  maxY: 100,
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 40),
                        FlSpot(1, 80),
                        FlSpot(2, 50),
                        FlSpot(3, 90),
                        FlSpot(4, 70),
                        FlSpot(5, 60),
                      ],
                      isCurved: true,
                      // colors: [Colors.teal],
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Text("History"),
          ),
          // Add the transaction containers
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                transactionhistory1(),
                transactionhistory2(),
                transactionhistory3(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget for the transaction history container

  Widget transactionhistory1() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xff73D2B6),
      ),
      height: 100,
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Icon(
            Icons.history,
            size: 50,
          ),
          Padding(padding: EdgeInsets.all(20)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Online Transfer",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Amount \$160 . Mon, 9th Nov 2023",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget transactionhistory2() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xff73D2B6),
      ),
      height: 100,
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Icon(
            Icons.history,
            size: 50,
          ),
          Padding(padding: EdgeInsets.all(20)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ATM Transaction",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Amount \$100 . Mon, 9th Nov 2023",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget transactionhistory3() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xff73D2B6),
      ),
      height: 100,
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Icon(
            Icons.history,
            size: 50,
          ),
          Padding(padding: EdgeInsets.all(20)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ATM Transaction",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Amount \$120 . Mon, 9th Nov 2023",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
