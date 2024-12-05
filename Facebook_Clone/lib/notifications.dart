import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Extended sample notifications data
    final List<Map<String, String>> notifications = [
      {
        "icon": "Icons.thumb_up",
        "title": "Muzammil liked your post",
        "description": "Your photo got a thumbs up!",
        "time": "2 hours ago"
      },
      {
        "icon": "Icons.comment",
        "title": "Sarah commented on your photo",
        "description": "Great shot! Keep it up.",
        "time": "3 hours ago"
      },
      {
        "icon": "Icons.group",
        "title": "John invited you to a group",
        "description": "Join 'Photography Enthusiasts'.",
        "time": "5 hours ago"
      },
      {
        "icon": "Icons.notifications",
        "title": "Reminder",
        "description": "Your subscription expires tomorrow.",
        "time": "1 day ago"
      },
      {
        "icon": "Icons.event",
        "title": "Event Update",
        "description": "The workshop is starting soon.",
        "time": "3 days ago"
      },
      {
        "icon": "Icons.star",
        "title": "New achievement unlocked",
        "description": "You’ve completed 5 tasks this week.",
        "time": "1 day ago"
      },
      {
        "icon": "Icons.shopping_cart",
        "title": "New items added to your cart",
        "description": "Check out the latest products.",
        "time": "2 days ago"
      },
      {
        "icon": "Icons.alarm",
        "title": "Reminder for meeting",
        "description": "Your meeting with the client is scheduled for 4 PM.",
        "time": "4 hours ago"
      },
      {
        "icon": "Icons.cloud_download",
        "title": "Download complete",
        "description": "Your file 'HolidayPhotos.zip' is ready.",
        "time": "6 hours ago"
      },
      {
        "icon": "Icons.email",
        "title": "New message received",
        "description": "You’ve got a new message from Alice.",
        "time": "7 hours ago"
      },
      {
        "icon": "Icons.warning",
        "title": "Warning",
        "description": "Your account will be locked if not verified.",
        "time": "2 days ago"
      },
    ];

    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 3,
            child: ListTile(
              leading: Icon(
                _getIcon(notification["icon"]!),
                size: 40,
                color: Colors.blueAccent,
              ),
              title: Text(
                notification["title"]!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text(notification["description"]!),
                  SizedBox(height: 5),
                  Text(
                    notification["time"]!,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case "Icons.thumb_up":
        return Icons.thumb_up;
      case "Icons.comment":
        return Icons.comment;
      case "Icons.group":
        return Icons.group;
      case "Icons.notifications":
        return Icons.notifications;
      case "Icons.event":
        return Icons.event;
      case "Icons.star":
        return Icons.star;
      case "Icons.shopping_cart":
        return Icons.shopping_cart;
      case "Icons.alarm":
        return Icons.alarm;
      case "Icons.cloud_download":
        return Icons.cloud_download;
      case "Icons.email":
        return Icons.email;
      case "Icons.warning":
        return Icons.warning;
      default:
        return Icons.notifications; // Default icon
    }
  }
}
