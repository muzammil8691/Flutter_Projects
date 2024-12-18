import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';


import '../usermodel.dart';


class DatabaseService {
  final String? uid;
  DatabaseService({required this.uid});

  String profilepic = '';

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

 /* Future savingUserData(
      String fullName, String email, String phone ) async {
    UserModel userModel = UserModel(
      fullName: fullName,
      email: email,
      phone: phone,
      category: category,
      profilepic: profilepic,
      uid: uid,
    );
    return await userCollection
        .doc(uid)
        .set(userModel.toMap())
        .whenComplete(() {
      print("added user scessfully");
    });
    }*/
  Future savingUserData(
      String fullName, String email, String phone, String category ) async {
    if (category == 'Student') {
      UserModel userModel = UserModel(
        fullName: fullName,
        email: email,
        phone: phone,
        category: category,
        profilepic: profilepic,
        uid: uid,
      );
      return await userCollection
          .doc(uid)
          .set(userModel.toMap())
          .whenComplete(() {
        print("added user scessfully");
      });
    }else{
      UserModel userModel = UserModel(
        fullName: fullName,
        email: email,
        phone: phone,
        category: category,
        profilepic: profilepic,
        uid: uid,
      );
      return await userCollection
          .doc(uid)
          .set(userModel.toMap())
          .whenComplete(() {
        print("added user scessfully");
      }); 
    }
  }


  Future updateProfilePic(String url) async {
    return await userCollection.doc(uid).update({
      'profilepic': url,
    });
  }

}



