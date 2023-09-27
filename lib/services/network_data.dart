import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app_api/model/weather.dart';

class NetworkData {
  final String url;
  

  NetworkData({required this.url});

  Future getWeatherData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      return Weather.fromJson(jsonDecode(data));
    } else {
      print(response.statusCode);
    }
  }

  Future getForecastData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
