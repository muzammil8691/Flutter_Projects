import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String equation = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Calculator",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(width: 8), // Add spacing between text and icon
            Icon(
              Icons.calculate, // Calculator icon
              color: Colors.white,
            ),
          ],
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            screen(),
            SizedBox(height: 100),
            allButtons(),
          ],
        ),
      ),
    );
  }

  Widget screen() {
    return Container(
        width: double.maxFinite,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Text(
              equation,
              style: const TextStyle(color: Colors.black, fontSize: 30),
            ),
          ],
        ));
  }

  Widget button({required btnname, btncolor, function}) {
    return InkWell(
      onTap: () {
        function();
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: CircleAvatar(
          radius: 35,
          backgroundColor: btncolor,
          child: Text(
            btnname!,
            style: const TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget allButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            button(
                btnname: '?',
                btncolor: Colors.grey[800],
                function: () {
                  equation = equation + 'First Flutter Project';
                }),
            button(
                btnname: '%',
                btncolor: Colors.grey[800],
                function: () {
                  equation = equation + '*100';
                }),
            button(
                btnname: 'CLR',
                btncolor: Colors.grey[800],
                function: () {
                  equation = equation = '';
                }),
            button(
                btnname: 'DEL',
                btncolor: Colors.orange[900],
                function: () {
                  equation = equation.substring(0, equation.length - 1);
                }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            button(
                btnname: '7',
                btncolor: Colors.grey[800],
                function: () {
                  equation = equation + '7';
                }),
            button(
                btnname: '8',
                btncolor: Colors.grey[800],
                function: () {
                  equation = equation + '8';
                }),
            button(
                btnname: '9',
                btncolor: Colors.grey[800],
                function: () {
                  equation = equation + '9';
                }),
            button(
                btnname: '/',
                btncolor: Colors.orange[900],
                function: () {
                  equation = equation + '/';
                }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            button(
                btnname: '4',
                btncolor: Colors.grey[800],
                function: () {
                  equation = equation + '4';
                }),
            button(
                btnname: '5',
                btncolor: Colors.grey[800],
                function: () {
                  equation = equation + '5';
                }),
            button(
                btnname: '6',
                btncolor: Colors.grey[800],
                function: () {
                  equation = equation + '6';
                }),
            button(
                btnname: 'x',
                btncolor: Colors.orange[900],
                function: () {
                  equation = equation + '*';
                }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            button(
              btnname: '1',
              btncolor: Colors.grey[800],
              function: () {
                equation = equation + '1';
              },
            ),
            button(
                btnname: '2',
                btncolor: Colors.grey[800],
                function: () {
                  equation = equation + '2';
                }),
            button(
                btnname: '3',
                btncolor: Colors.grey[800],
                function: () {
                  equation = equation + '3';
                }),
            button(
                btnname: '-',
                btncolor: Colors.orange[900],
                function: () {
                  equation = equation + '-';
                }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            button(
                btnname: '0',
                btncolor: Colors.grey[800],
                function: () {
                  equation = equation + '0';
                }),
            button(
                btnname: '.',
                btncolor: Colors.grey[800],
                function: () {
                  equation = equation + '.';
                }),
            button(
                btnname: '=',
                btncolor: Colors.redAccent[700],
                function: () {
                  calculation();
                }),
            button(
                btnname: '+',
                btncolor: Colors.orange[900],
                function: () {
                  equation = equation + '+';
                }),
          ],
        ),
      ],
    );
  }

  void calculation() {
    Parser p = Parser();
    Expression expression = p.parse(equation);
    ContextModel cm = ContextModel();
    double result = expression.evaluate(EvaluationType.REAL, cm);
    equation = result.toString();
  }
}
