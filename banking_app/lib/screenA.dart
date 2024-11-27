// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCDF1E5),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          account(),
          buttonsrow(),
          horizontalscroll(),
          sizedBoxExample(),
          transactions(),
          pictureRow(),
          transactionhistory1(),
          transactionhistory2(),
          transactionhistory3(),
        ],
      ),
    );
  }

  Widget account() {
    return Container(
      margin: EdgeInsets.only(top: 50, left: 10),
      child: Text(
        "Account",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buttonsrow() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: Color(0xff73D2B6),
            border: Border.all(
              color: Color(0xff257C69),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text("All"),
        ),
        Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xff257C69),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text("Freelance"),
        ),
        Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xff257C69),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Text("Add"),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  margin: EdgeInsets.only(left: 2),
                  decoration: BoxDecoration(
                    color: Color(0xff73D2B6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "+",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }

  Widget horizontalscroll() {
    return Container(
      padding: EdgeInsets.all(10),
      width: 500,
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 300,
            height: 150,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xff459D87),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.currency_bitcoin_rounded, size: 50),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "South Korean Won",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          "129,500",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            width: 300,
            height: 150,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xff688AC7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.currency_ruble_sharp, size: 50),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Singapore",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          "110,500",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            width: 300,
            height: 150,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xff6200F6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.currency_exchange_outlined, size: 50),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "China",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          "98,000",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget sizedBoxExample() {
    return SizedBox(
      height: 20.0, // Fixed height
      child: Container(),
    );
  }

  Widget transactions() {
    return Container(
      margin: EdgeInsets.only(top: 50, left: 10),
      child: Text(
        "Transactions",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  // At the end of your ScreenA class, add this widget:

  Widget pictureRow() {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 20, horizontal: 20), // Add some spacing
      child: Row(
        // Distribute evenly
        children: [
          circleIcon(Icons.person),
          SizedBox(width: 10),
          circleIcon(Icons.person_2),
          SizedBox(width: 10),
          circleIcon(Icons.person_3),
          SizedBox(width: 10),
          circleIcon(Icons.person_4),
        ],
      ),
    );
  }

  Widget circleIcon(IconData icon) {
    return Container(
      width: 40, // Diameter = 2 * radius
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        shape: BoxShape.circle,
        color: Color(0xff73D2B6), // Background color
      ),
      child: Icon(
        icon,
        color: Colors.black, // Icon color
        size: 24, // Icon size
      ),
    );
  }

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
            Icons
                .arrow_downward, // CupertinoIcons.camera can be replaced with Icons.camera_alt for consistency
            size: 50,
          ),
          Padding(padding: EdgeInsets.all(20)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "From M.Muzammil",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "KRW Balance . Mon, 12th Nov 2023",
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
            Icons
                .arrow_downward, // CupertinoIcons.camera can be replaced with Icons.camera_alt for consistency
            size: 50,
          ),
          Padding(padding: EdgeInsets.all(20)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "From Khursheed",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "KRW Balance . Mon, 10th Nov 2023",
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
            Icons
                .arrow_downward, // CupertinoIcons.camera can be replaced with Icons.camera_alt for consistency
            size: 50,
          ),
          Padding(padding: EdgeInsets.all(20)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "From Yaseen",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "KRW Balance . Mon, 9th Nov 2023",
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
