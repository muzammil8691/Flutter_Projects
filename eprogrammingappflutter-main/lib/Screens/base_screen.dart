
import 'package:eprogrammingappflutter/Model/db.dart';
import 'package:eprogrammingappflutter/widget/Appcolor.dart';
import 'package:eprogrammingappflutter/widget/custom_button.dart';
import 'package:eprogrammingappflutter/widget/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';



class BaseScreen extends StatefulWidget {
  final String title;

  const BaseScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  Future<void> _launchInWebView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final tutorial = ModalRoute.of(context)!.settings.arguments as Tutorial;
   // print(tutorial.title);
    //print(tutorial.description);
   // print(tutorial.code);
   // print(tutorial.videolinks);
    String videoIdFromDatabase = tutorial.videolinks;
    //String videoIdFromDatabase = '1ukSR1GRtMU';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: //Text('Flutter'),
        Text(tutorial.title.toString(),
          style: title,
        ),

        leading: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomIconButton(
              height: 0,
              width: 0,
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back,
                color: Color(0xFF0072BB),
              ),
            ),
          ),
        ),
        backgroundColor: AppColors.Appbacground,
        elevation: 5,
        bottom: TabBar(
          controller: _tabController,

          tabs: [
            Tab(text: 'Description',
              icon: Icon(Icons.description_outlined),),
            Tab(text: 'Code',
              icon: Icon(Icons.code),),
            Tab(text: 'Video',
              icon: Icon(Icons.video_camera_back_outlined),),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  tutorial.description.toString(),
                  style: kAnswers,
                  textAlign: TextAlign.justify,
                ),
              );
            },
          ),

          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15),
              child: HighlightView(
                tutorial.code.toString(),
                language: 'dart',
                theme: githubTheme,
                padding: EdgeInsets.all(10),
                textStyle: TextStyle(
                  fontFamily: 'Courier',
                  //fontFamily: 'Poppins',
                  fontSize: 14,

                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15),
                child:YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: videoIdFromDatabase,
                    flags: YoutubePlayerFlags(
                      autoPlay: true,
                      mute: false,
                    ),
                  ),
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.blueAccent,
                  onReady: () {
                    // Perform actions on player ready if needed
                  },
                  onEnded: (metaData) {
                    // Perform actions when the video ends if needed
                  },
                ),
            ),

            ),

        ],
      ),
    );
  }
}