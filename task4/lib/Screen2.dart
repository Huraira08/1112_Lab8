import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  String msg = "";

  @override
  initState() {
    super.initState();
    setState(() {
      msg = "Second Screen is loaded";
      print("Second Screen is loaded");
    });
  }

  deactivate() {
    super.deactivate();
    print("Screen dismissed");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text(msg),
          FlatButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Go back"),
          )
        ],
      )),
    );
  }
}
