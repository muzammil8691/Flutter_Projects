import 'package:eprogrammingappflutter/Model/db.dart';
import 'package:eprogrammingappflutter/widget/Appcolor.dart';
import 'package:eprogrammingappflutter/widget/custom_button.dart';
import 'package:eprogrammingappflutter/widget/item_widget.dart';
import 'package:eprogrammingappflutter/widget/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class TutorialScreen extends StatefulWidget {
  String name;
  int categoryid;
  TutorialScreen({required this.name, required this.categoryid});
  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context)!.settings.arguments);
    final params = ModalRoute.of(context)!.settings.arguments as Map;
    final tutorials = params["tutorials"] as List<Tutorial>;
    final category = widget.categoryid;


    //print('Received Tutorials: $tutorials');
    print("ListView length: ${tutorials.length}");

    return Scaffold(
      backgroundColor: AppColors.Appbacground,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicHeight(
              child: Stack(
                children: [
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                       widget.name,
                        style: title,
                        //  style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 6,
                    child: CustomIconButton(
                      child: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF0072BB),
                      ),
                      height: 35,
                      width: 35,
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            (category == 1 || category == 2|| category == 3|| category == 4|| category == 5|| category == 6)
                ? Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      primary: false,
                      itemCount: tutorials.length,
                      itemBuilder: (context, index) {
                        return item(context, tutorials[index]);
                      },
                    ),
                  )
                : (category == 30)
                    ? Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                primary: false,
                itemCount: tutorials.length,
                itemBuilder: (context, index) {
                  return item(context, tutorials[index]);
                },
              ),
            ) : Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                primary: false,
                itemCount: tutorials.length,
                itemBuilder: (context, index) {
                  return item(context, tutorials[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

