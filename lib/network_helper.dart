import 'dart:convert';
import 'location.dart';
import 'package:http/http.dart';
import 'locading_screen.dart';

class NetworkHelper {
  String url;
  final String api_key = '48a5927d387a65d7315fbc637b228ef7';

  NetworkHelper(this.url);

  Future<Map> fetchWeatherInfo() async {
    // my prev url 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=48a5927d387a65d7315fbc637b228ef7'
    Response response = await get(url);
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
}
