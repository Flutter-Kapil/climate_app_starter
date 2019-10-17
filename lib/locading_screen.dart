import 'package:clima/network_helper.dart';
import 'package:clima/weatherDisplay_screen.dart';
import 'package:flutter/material.dart';
import 'location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  final String userCityName;
  final String myAPIkey = 'your api key here';
  LoadingScreen([this.userCityName]);
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
    fetchWeatherData();
  }

  void fetchWeatherData() async {
    NetworkHelper helper;
    if (widget.userCityName == '') {
      helper = NetworkHelper(
          'https://api.openweathermap.org/data/2.5/weather?lat=${myLocation.latitude}&lon=${myLocation.longitude}&appid=${widget.myAPIkey}');
    } else {
      helper = NetworkHelper(
          'https://api.openweathermap.org/data/2.5/weather?q=${widget.userCityName}&appid=${widget.myAPIkey}');
    }

    Map weatherDataMap = await helper.fetchWeatherInfo();
    Navigator.pushReplacement(
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
