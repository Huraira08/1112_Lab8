import 'package:flutter/material.dart';
import 'package:task4/Screen1.dart';
import 'package:task4/Screen2.dart';

void main() {
  runApp(MaterialApp(
    // home: Screen1(),
    routes: {"/": (context) => Screen1(), "/s2": (context) => Screen2()},
  ));
}
