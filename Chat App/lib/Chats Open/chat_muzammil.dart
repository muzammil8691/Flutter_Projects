// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

class MuzammilChat extends StatefulWidget {
  MuzammilChat({Key? key}) : super(key: key);

  String id = "MuzammilChat";

  @override
  State<MuzammilChat> createState() => _MuzammilChatState();
}

class _MuzammilChatState extends State<MuzammilChat> {
  TextEditingController chatController = TextEditingController();
  String? message;
  List<MessageContainerClass> messageList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff006156),
        title: ListTile(
          leading: const CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text(
            "Muzammil",
            style: const TextStyle(color: Colors.deepOrangeAccent),
          ),
          subtitle: const Text(
            "Online",
            style: TextStyle(color: Colors.yellowAccent),
          ),
        ),
        actions: const [
          Icon(
            Icons.video_call,
            color: Colors.deepOrangeAccent,
          ),
          SizedBox(width: 20),
          Icon(
            Icons.phone,
            color: Colors.deepOrangeAccent,
          ),
          SizedBox(width: 20),
          Icon(
            Icons.more_vert,
            color: Colors.deepOrangeAccent,
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messageList.length,
              itemBuilder: (context, index) {
                return messageList[index];
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            children: [
              const Icon(Icons.emoji_emotions),
              const SizedBox(width: 5),
              Expanded(
                child: TextFormField(
                  controller: chatController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Message",
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print(chatController.text);

                  message = chatController.text;
                  chatController.clear();

                  if (message != null && message!.isNotEmpty) {
                    setState(() {
                      messageList.add(
                        MessageContainerClass(message: message.toString()),
                      );
                    });
                  }
                },
                child: const Icon(
                  Icons.send,
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageContainerClass extends StatelessWidget {
  String? message;

  MessageContainerClass({required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.all(5),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.6,
          ),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              message.toString(),
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
