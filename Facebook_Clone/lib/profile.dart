import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCoverPhoto(),
            _buildProfileInfo(context),
            _buildActionButtons(),
            _buildPosts(),
          ],
        ),
      ),
    );
  }

  // Builds cover photo section
  Widget _buildCoverPhoto() {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image.asset(
          'assets/photo8.jpg', // Placeholder for cover photo
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        const Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircleAvatar(
            radius: 50,
            backgroundImage:
                AssetImage('assets/Profile.jpg'), // Profile picture
            backgroundColor: Colors.transparent,
          ),
        ),
      ],
    );
  }

  // Builds profile info section
  Widget _buildProfileInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Muhammad Muzammil',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Software Engineer | Machine Learning Enthusiast',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'This is the bio section. Add your personal description here.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Contact Info:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text('Email: m.muzammil8691@gmail.com'),
          Text('City: Nowshera, KPK'),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  // Builds action buttons (Edit Profile, Friends, etc.)
  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildActionButton('Edit Profile', Icons.edit),
          _buildActionButton('Friends', Icons.group),
        ],
      ),
    );
  }

  // Helper function to create an action button
  Widget _buildActionButton(String label, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        primary: Colors.blueAccent,
        onPrimary: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _buildPosts() {
    return Column(
      children: [
        _buildPost('assets/photo1.jpg', 'Muzammil', '2 hours ago',
            'Had a great day today!'),
        _buildPost('assets/photo2.jpg', 'Muzammil', '5 hours ago',
            'Learning Flutter!'),
        _buildPost('assets/photo3.jpg', 'Muzammil', '1 day ago',
            'Exploring AI and ML.'),
      ],
    );
  }

  Widget _buildPost(
      String image, String username, String time, String content) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: const CircleAvatar(
              radius: 25,
              backgroundImage:
                  AssetImage('assets/Profile.jpg'), // Profile picture
            ),
            title:
                Text(username, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(time, style: TextStyle(color: Colors.grey[600])),
          ),
          Image.asset(image,
              width: double.infinity, height: 200, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(content),
          ),
          _buildPostActions(),
        ],
      ),
    );
  }

  Widget _buildPostActions() {
    return const Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.thumb_up_alt_outlined, color: Colors.blueAccent),
              SizedBox(width: 5),
              Text('Like'),
            ],
          ),
          Row(
            children: [
              Icon(Icons.comment_outlined, color: Colors.blueAccent),
              SizedBox(width: 5),
              Text('Comment'),
            ],
          ),
          Row(
            children: [
              Icon(Icons.share_outlined, color: Colors.blueAccent),
              SizedBox(width: 5),
              Text('Share'),
            ],
          ),
        ],
      ),
    );
  }
}
