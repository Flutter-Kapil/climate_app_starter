import 'weatherDisplay_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'location.dart';
import 'locading_screen.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
//  Future<Position> geLocation() async {
//    Position position = await Geolocator()
//        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//    print(position.latitude);
//    print(position.longitude);
//    return position;
//  }

// function which returns Map, from json data obtained from URL
  Future<Map> fetchWeatherInfo(double lat, double long) async {
    Response response = await get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=48a5927d387a65d7315fbc637b228ef7');
    if (response.statusCode == 200) {
      print("response 200");
    }
    Map<String, dynamic> weatherDataMap = jsonDecode(response.body);
    return weatherDataMap;
//    double maxTemp = weatherDataMap['main']['temp_max'];
//    double minTemp = weatherDataMap['main']['temp_min'];
//    String cityName = weatherDataMap['name'];
//    print('city $cityName max $maxTemp min $minTemp');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: null,
              ),
              FlatButton(
                onPressed: () async {
                  print('hello');
                  try {
////                    Position myPosition = await geLocation();
//                    Map gatheredData = await fetchWeatherInfo(
//                        myPosition.latitude, myPosition.longitude);
//                    Navigator.push(
//                        (context),
//                        MaterialPageRoute(
//                            builder: (context) => LocationScreen(
//                                  weatherData: gatheredData,
//                                )));
                    Navigator.push(
                        (context),
                        MaterialPageRoute(
                            builder: (context) => LoadingScreen()));
                  } catch (error) {
                    print("location error");
                    Alert(
                            context: context,
                            title: "Permission Issue",
                            desc:
                                "Please grant location permission for app to function")
                        .show();
                  }
                },
                child: Text(
                  'Get Weather',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Spartan MB',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
