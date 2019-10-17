import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'locading_screen.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final textEnteredInBox = TextEditingController();

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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: textEnteredInBox,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.home,
                      size: 30,
                    ),
                    fillColor: Colors.white,
                    hintText: "Enter City Name",
                    hintStyle: TextStyle(color: Colors.black12),
                    filled: true,
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Colors.white24, width: 5.0),
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () async {
                  try {
                    Navigator.push(
                        (context),
                        MaterialPageRoute(
                            builder: (context) =>
                                LoadingScreen(textEnteredInBox.text)));
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
