import 'dart:math';

import 'package:flutter/material.dart';
import 'helpers/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primaryColor: appDarkGreyColor,
      ),
      home: FactPage(),
    );
  }
}

class FactPage extends StatefulWidget {
  @override
  _FactPageState createState() => _FactPageState();
}

class _FactPageState extends State<FactPage> {
  String fact = 'Click the button to get random fun facts';

  void changeMessage() {
    setState(() {
      fact = facts[randomNumber()];
    });
  }

  int randomNumber() => Random().nextInt(facts.length);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appDarkGreyColor,
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    fact,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: RaisedButton(
                  onPressed: () {
                    changeMessage();
                  },
                  color: Colors.white,
                  child: Text(
                    "Show another Fun Fact",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
