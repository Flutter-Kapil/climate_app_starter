import 'dart:convert';
import 'package:http/http.dart';

class NetworkHelper {
  String url;
  String cityName;

  NetworkHelper([this.url, this.cityName]);

  Future<Map> fetchWeatherInfo() async {
    Response response = await get(url);
    if (response.statusCode == 200) {
      print("response 200");
    }
    Map<String, dynamic> weatherDataMap = jsonDecode(response.body);
    return weatherDataMap;
  }
}
