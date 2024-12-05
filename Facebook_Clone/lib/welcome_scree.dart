import 'package:Facebook/marketplace.dart';
import 'package:Facebook/notifications.dart';
import 'package:Facebook/profile.dart';
import 'package:flutter/material.dart';
import 'videos.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Facebook")),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          bottom: const TabBar(
            indicatorColor: Colors.blue,
            indicatorWeight: 3,
            tabs: [
              Tab(icon: Icon(Icons.home_filled)),
              Tab(icon: Icon(Icons.video_collection_sharp)),
              Tab(icon: Icon(Icons.shopping_bag_outlined)),
              Tab(icon: Icon(Icons.notifications)),
              Tab(icon: Icon(Icons.person)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FeedScreen(),
            Videos(),
            Marketplace(),
            NotificationsScreen(),
            ProfileScreen()
          ],
        ),
      ),
    );
  }
}

class FeedScreen extends StatelessWidget {
  final List<String> images = [
    'assets/photo1.jpg',
    'assets/photo2.jpg',
    'assets/photo3.jpg',
    'assets/photo4.jpg',
    'assets/photo5.jpg',
    'assets/photo6.jpg',
    'assets/photo7.jpg',
    'assets/photo8.jpg',
    'assets/photo9.jpg',
    'assets/photo10.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.only(bottom: 15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 5,
          child: Column(
            children: [
              const ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/Profile.jpg'),
                ),
                title: Text(
                  'Muzammil',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Posted 2 hours ago'),
                trailing: Icon(Icons.more_vert),
              ),
              Image.asset(images[index], fit: BoxFit.cover),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.thumb_up_alt_outlined,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(width: 5),
                        Text('Like'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.comment_outlined,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(width: 5),
                        Text('Comment'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.share_outlined,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(width: 5),
                        Text('Share'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
