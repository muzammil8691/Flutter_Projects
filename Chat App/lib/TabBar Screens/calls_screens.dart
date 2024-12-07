import 'package:flutter/material.dart';

class CallsScreen extends StatefulWidget {
  final String id = 'CallsScreen';

  CallsScreen({super.key});

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  // Mock data for call history
  List<Map<String, String>> callHistory = [
    {"name": "Home", "time": "2:30 PM", "type": "Incoming"},
    {"name": "Modasser", "time": "1:45 PM", "type": "Missed"},
    {"name": "Home", "time": "12:00 PM", "type": "Outgoing"},
    {"name": "Life", "time": "Yesterday", "type": "Incoming"},
    {"name": "Sis", "time": "Last Week", "type": "Missed"},
    {"name": "Unknown", "time": "Last Week", "type": "Missed"},
    {"name": "Unknown", "time": "Last Week", "type": "Missed"},
    {"name": "Unknown", "time": "Last Week", "type": "Missed"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff006156),
      body: ListView.builder(
        itemCount: callHistory.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            color: Colors.white70,
            elevation: 5,
            child: ListTile(
              contentPadding: EdgeInsets.all(15),
              title: Text(
                callHistory[index]["name"]!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(callHistory[index]["time"]!),
              leading: Icon(
                callHistory[index]["type"] == "Missed"
                    ? Icons.call_missed
                    : callHistory[index]["type"] == "Incoming"
                        ? Icons.call_received
                        : Icons.call_made,
                color: callHistory[index]["type"] == "Missed"
                    ? Colors.red
                    : callHistory[index]["type"] == "Incoming"
                        ? Colors.green
                        : Colors.blue,
              ),
              onTap: () {
                // Add functionality to navigate to call details or initiate a new call
              },
            ),
          );
        },
      ),
    );
  }
}
