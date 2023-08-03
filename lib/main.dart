import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[800],
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.blue[800],
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                child: Image.asset('images/dice1.png'),
                onPressed: (){
                  // Do something when the button is pressed.
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                child: Image.asset('images/dice2.png'),
                onPressed: (){
                  // Do something when the Button is pressed
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}