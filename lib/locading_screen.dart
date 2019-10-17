import 'package:clima/network_helper.dart';
import 'package:clima/weatherDisplay_screen.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'getLocation_screen.dart';

class LoadingScreen extends StatefulWidget {
  final String userCityName;
  final String myAPIkey = 'Your API here';
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
    try {
      await myLocation.geLocation();
      fetchWeatherData();
    } catch (e) {
      Alert(
        style: AlertStyle(
          isOverlayTapDismiss: false,
          isCloseButton: false,
          backgroundColor: Colors.white30,
        ),
        context: context,
        type: AlertType.error,
        title: "Location Permission Denied",
        desc: "Please Grant Location Permission to app",
        buttons: [
          DialogButton(
            child: Text(
              "Go Back",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop((context),
                MaterialPageRoute(builder: (context) => CityScreen())),
            width: 120,
          )
        ],
      ).show();
    }
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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/city_background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      constraints: BoxConstraints.expand(),
      child: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
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
