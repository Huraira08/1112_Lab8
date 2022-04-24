import 'package:flutter/material.dart';
import 'package:task4/Screen2.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FlatButton(
        color: Colors.blue,
        onPressed: () {
          Navigator.pushNamed(context, "/s2");
        },
        child: Text("Next Screen"),
      )),
    );
  }
}
