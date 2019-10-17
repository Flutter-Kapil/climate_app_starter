import 'package:clima/network_helper.dart';
import 'package:clima/weatherDisplay_screen.dart';
import 'package:flutter/material.dart';
import 'location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location myLocation = Location();
  @override
  void initState() {
    getCurrentLocation();
    // TODO: implement initState
    print("init state called");
    super.initState();
  }

  void getCurrentLocation() async {
    await myLocation.geLocation();
//    print(myLocation.latitude);
//    print(myLocation.longitude);
    fetchWeatherData();
  }

  void fetchWeatherData() async {
    NetworkHelper helper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${myLocation.latitude}&lon=${myLocation.longitude}&appid=48a5927d387a65d7315fbc637b228ef7');

    Map weatherDataMap = await helper.fetchWeatherInfo();
    Navigator.push(
        (context),
        MaterialPageRoute(
            builder: (context) => LocationScreen(
                  weatherData: weatherDataMap,
                )));
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
