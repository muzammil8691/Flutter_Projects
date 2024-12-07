import 'package:flutter/material.dart';

class StatusScreen extends StatefulWidget {
  StatusScreen({super.key});
  final String id = 'StatusScreen';

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  // Mock data for updates (e.g., WhatsApp channels, news, announcements)
  List<Map<String, String>> updatesList = [
    {
      "channel": "Chating App News",
      "update": "New privacy policy announced! Check it out."
    },
    {
      "channel": "Tech Updates",
      "update": "Flutter 3.2 is released with new features."
    },
    {
      "channel": "Sports",
      "update": "The World Cup final match will take place tomorrow."
    },
    {
      "channel": "Music",
      "update": "New album released by your favorite artist!"
    },
    {
      "channel": "Politics",
      "update": "Arrest warrant issued for former prime minister Imran Khan."
    },
    {
      "channel": "Festivals",
      "update": "New York is ready for Christmass celebrattions."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff006156),
      body: ListView.builder(
        itemCount: updatesList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            color: Colors.white70,
            elevation: 5,
            child: ListTile(
              contentPadding: EdgeInsets.all(15),
              title: Text(
                updatesList[index]["channel"]!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(updatesList[index]["update"]!),
              leading: Icon(
                Icons.notifications_active,
                color: Colors.green,
              ),
              onTap: () {
                // Add functionality to navigate to more detailed content or channel page
              },
            ),
          );
        },
      ),
    );
  }
}
