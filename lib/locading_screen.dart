import 'package:flutter/material.dart';
import 'location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getCurrentLocation();
    // TODO: implement initState
    print("init state called");
    super.initState();
  }

  void getCurrentLocation() async {
    Location myLocation = Location();
    await myLocation.geLocation();
    print(myLocation.latitude);
    print(myLocation.longitude);
  }

  @override
  Widget build(BuildContext context) {
    print("build state called");
    return Center(
      child: SpinKitRotatingCircle(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }

  @override
  void dispose() {
    print("dispose state called");
    // TODO: implement dispose
    super.dispose();
  }
}
