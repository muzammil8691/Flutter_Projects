
import 'package:eprogrammingappflutter/Auth/helper_function.dart';
import 'package:eprogrammingappflutter/Auth/services/database_Service.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthServices {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //login
  Future loginUser(String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user!;
      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //register
  Future regiseterUser(String fullName, String email, String password,
      String phone,String category) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password)).user!;
      if (user != null) {
        await DatabaseService(uid: user.uid).savingUserData(fullName, email, phone,category);

       // await user.sendEmailVerification();

        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return ('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return ('The account already exists for that email.');
      }
      return e.message;
    }
  }

  //logout
  Future singout() async {
    try {
      await HelperFunction.saveUserLoggedInStatus(false);
      await HelperFunction.saveUserNameSp('');
      await HelperFunction.saveUserEmail('');
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      return null;
    }
  }
}
