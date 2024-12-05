// ignore: file_names
import 'package:Facebook/welcome_scree.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController emailController = TextEditingController();

  late TextEditingController passwordController = TextEditingController();
  String loginButtonName = 'Login';
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4B69A9),
      body: Container(
        padding: const EdgeInsets.only(top: 70),
        child: Column(
          children: [
            fbTitle(),
            emailsTextField(),
            passwordTextField(),
            const Padding(
              padding: EdgeInsets.only(top: 50),
            ),
            loginButton(),
            const Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            forgetPassword(),
          ],
        ),
      ),
    );
  }

  Widget fbTitle() {
    return const Text(
      style: TextStyle(
          fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white),
      "Facebook",
    );
  }

  Widget emailsTextField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        controller: emailController,
        style: const TextStyle(fontSize: 16),
        onChanged: (value) {},
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.email,
            color: Colors.blue,
          ),
          border: InputBorder.none,
          hintText: 'Enter Email Here',
        ),
      ),
    );
  }

  Widget passwordTextField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        style: const TextStyle(fontSize: 16),
        controller: passwordController,
        onChanged: (value) {},
        obscureText: toggle,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            CupertinoIcons.lock_fill,
            color: Colors.blue,
          ),
          suffixIcon: InkWell(
            onTap: () {
              if (toggle == false) {
                toggle = true;
              } else if (toggle == true) {
                toggle = false;
              }
              setState(() {});
            },
            child: Icon(
              toggle == false
                  ? CupertinoIcons.eye_fill
                  : CupertinoIcons.eye_slash,
              color: Colors.blue,
            ),
          ),
          border: InputBorder.none,
          hintText: 'Enter Password Here',
        ),
      ),
    );
  }

  Widget loginButton() {
    return InkWell(
      onTap: () {
        login(
            email: emailController.text,
            password: int.parse(passwordController.text));
      },
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xff233B71),
            borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
        child: Text(
          loginButtonName,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget forgetPassword() {
    return const Text(
      "Forgot Password?",
      style: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.underline,
          fontStyle: FontStyle.italic),
    );
  }

  void login({required String email, required int password}) {
    try {
      if (email == 'abcd@gmail.com' && password == 12345) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => WelcomeScreen()),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) => const AlertDialog(
            title: Text('Wrong email or password'),
          ),
        );
        print('wrong email or password');
      }
    } catch (e) {
      print(e);
    }
  }
}
