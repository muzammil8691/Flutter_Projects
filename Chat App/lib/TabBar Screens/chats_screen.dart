import 'package:flutter/material.dart';
import 'package:Chatting_App/Chats%20Open/chat_muzammil.dart';

// ignore: must_be_immutable
class ChatsScreen extends StatefulWidget {
  ChatsScreen({super.key});
  String id = 'ChatsScreen';

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff006156),
      body: Container(
        child: ListView(
          children: [
            chats(
              photo: Icon(Icons.person),
              name: "Muzammil",
              message: "Chat with your loved ones anywhere, anytime.",
              chatOpen: MuzammilChat().id,
            ),
            chats(
              photo: Icon(Icons.person),
              name: "Father :)",
              message: "Chat with your loved ones anywhere, anytime.",
            ),
            chats(
              photo: Icon(Icons.person),
              name: "Yaseen",
              message: "Chat with your loved ones anywhere, anytime.",
            ),
            chats(
              photo: Icon(Icons.person),
              name: "Modasser",
              message: "Chat with your loved ones anywhere, anytime.",
            ),
            chats(
              photo: Icon(Icons.person),
              name: "Mother Home :) ",
              message: "Chat with your loved ones anywhere, anytime.",
            ),
            chats(
              photo: Icon(Icons.person),
              name: "Sis Zong",
              message: "Chat with your loved ones anywhere, anytime.",
            ),
            chats(
              photo: Icon(Icons.person),
              name: "Usama",
              message: "Chat with your loved ones anywhere, anytime.",
            ),
            chats(
              photo: Icon(Icons.person),
              name: "Ahmed",
              message: "Chat with your loved ones anywhere, anytime.",
            ),
            chats(
              photo: Icon(Icons.person),
              name: "Muzammil",
              message: "Chat with your loved ones anywhere, anytime.",
            ),
            chats(
              photo: Icon(Icons.person),
              name: "Siraj",
              message: "Chat with your loved ones anywhere, anytime.",
            ),
            chats(
              photo: Icon(Icons.person),
              name: "Hostel Warden",
              message: "Chat with your loved ones anywhere, anytime.",
            ),
            chats(
              photo: Icon(Icons.person),
              name: "Roommate",
              message: "Chat with your loved ones anywhere, anytime.",
            ),
            chats(
              photo: Icon(Icons.person),
              name: "Laptop Shop",
              message: "Chat with your loved ones anywhere, anytime.",
            ),
          ],
        ),
      ),
    );
  }

  Widget chats({Widget? photo, String? name, String? message, chatOpen}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      color: Colors.white70,
      elevation: 0,
      child: InkWell(
        onTap: () {
          setState(() {
            Navigator.pushNamed(context, chatOpen);
          });
        },
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          leading: CircleAvatar(
              child: photo, backgroundColor: Colors.deepOrangeAccent),
          title: Text(
            name.toString(),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            message.toString(),
            style: TextStyle(color: Colors.black54),
          ),
          trailing: const Icon(
            Icons.message_outlined,
            color: Colors.deepOrangeAccent,
          ),
        ),
      ),
    );
  }
}
