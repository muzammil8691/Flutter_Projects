import 'package:flutter/material.dart';

class ScreenC extends StatelessWidget {
  const ScreenC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCDF1E5),
      body: Column(
        children: [
          SizedBox(height: 50), // Adding some space from the top
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Other Services', // Heading
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
          ),
          SizedBox(height: 20), // Space after the heading
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                serviceCard(Icons.phone_android, "Mobile Packages"),
                serviceCard(Icons.payments, "Bill Payment"),
                serviceCard(Icons.account_balance, "Bank Transfers"),
                serviceCard(Icons.credit_card, "Card Services"),
                serviceCard(Icons.person, "Customer Support"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget to create each service container with an icon and title
  Widget serviceCard(IconData icon, String serviceName) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.teal,
          ),
          SizedBox(width: 20),
          Text(
            serviceName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
