import 'package:flutter/material.dart';

class Videos extends StatelessWidget {
  const Videos({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> videoTitles = [
      "Video 1",
      "Video 2",
      "Video 3",
      "Video 4",
      "Video 5",
      "Video 6",
    ];

    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: videoTitles.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.only(bottom: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        videoTitles[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Icon(Icons.more_vert),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.thumb_up_alt_outlined),
                          SizedBox(width: 5),
                          Text('Like'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.comment_outlined),
                          SizedBox(width: 5),
                          Text('Comment'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.share_outlined),
                          SizedBox(width: 5),
                          Text('Share'),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}
