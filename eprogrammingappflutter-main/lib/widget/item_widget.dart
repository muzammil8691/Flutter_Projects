import 'package:eprogrammingappflutter/Model/db.dart';
import 'package:eprogrammingappflutter/Screens/base_screen.dart';
import 'package:eprogrammingappflutter/widget/Appcolor.dart';
import 'package:flutter/material.dart';


Widget item(BuildContext context, Tutorial tutorial) {
  return Material(
    color: Colors.white,
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BaseScreen(title: 'test'),
            settings: RouteSettings(
              arguments: tutorial,
            ),
          ),
        );
      },
      child: Container(
        height: 80,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.Appbacground,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${tutorial.title}",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
                size: 30.0,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
