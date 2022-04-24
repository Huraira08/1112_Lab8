import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(GeoLocation());
}

class GeoLocation extends StatefulWidget {
  GeoLocation({Key? key}) : super(key: key);

  @override
  State<GeoLocation> createState() => _GeoLocationState();
}

class _GeoLocationState extends State<GeoLocation> {
  var longitude = "";
  var latitude = "";
  var per = "";
  @override
  void getCurrentPosition() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("Permission denied");
        //return;
      } else {
        print("Permission given");
      }
    }

    try {
      if (!(permission == LocationPermission.denied)) {
        print("Permission GIven");

        Position pos = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        print(pos.longitude);
        print(pos.latitude);
        setState(() {
          longitude = pos.longitude.toString();
          latitude = pos.latitude.toString();
          CheckPermission();
        });
      }
    } catch (e) {
      setState(() {
        longitude = "Unknwon";
        latitude = "Unknown";
        per = "Denied";
      });
    }
  }

  void CheckPermission() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      setState(() {
        per = "Denied";
      });
    } else {
      setState(() {
        per = "Given";
      });
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.yellow),
              child: TextButton(
                onPressed: () {
                  getCurrentPosition();
                },
                child: Text("Get Location"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Longitude is $longitude\nLatitude is $latitude"),
            Text("Current permission is $per"),
          ],
        )),
      ),
    );
  }
}
