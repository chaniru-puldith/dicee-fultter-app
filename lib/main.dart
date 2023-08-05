import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[800],
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.blue[800],
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  String result = '';
  Color resultColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      child: Image.asset('images/dice$leftDiceNumber.png'),
                      onPressed: (){
                        rollDices();
                      }
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      child: Image.asset('images/dice$rightDiceNumber.png'),
                      onPressed: (){
                        rollDices();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              children: <Widget>[
                Expanded(child: Text(
                  result,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: resultColor, fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void rollDices () {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;

      if (leftDiceNumber > rightDiceNumber) {
        result = 'You Win!';
        resultColor = Colors.green;
      } else if (leftDiceNumber < rightDiceNumber) {
        result = 'You Loose!';
        resultColor = Colors.red;
      }
    });
  }
}

