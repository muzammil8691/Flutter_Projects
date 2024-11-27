import 'package:flutter/material.dart';

class ScreenD extends StatelessWidget {
  const ScreenD({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCDF1E5),
      body: Column(
        children: [
          // Profile Header Section
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              color: Colors.teal[700],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50, // Profile picture size
                  backgroundImage:
                      AssetImage('images/profile.png'), // Add an image asset
                ),
                SizedBox(height: 10),
                Text(
                  "Muhammad Muzammil", // Name
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Premium Account", // Account type
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          // Profile Details Section
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  profileDetailRow(Icons.badge, "CNIC", "17301-XXXXXXX-5"),
                  profileDetailRow(
                      Icons.calendar_today, "Date of Birth", "23 Jun 2000"),
                  profileDetailRow(
                      Icons.email, "Email", "m.muzammil8691@gmail.com"),
                  profileDetailRow(
                      Icons.phone, "Phone Number", "+92 318 XXXX XXX"),
                  profileDetailRow(
                      Icons.location_on, "Address", "Npwshera, KPK"),
                  profileDetailRow(
                      Icons.account_balance, "Account Balance", "\$10,000"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget to create rows for profile details
  Widget profileDetailRow(IconData icon, String title, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(15),
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
            size: 30,
            color: Colors.teal,
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 5),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
