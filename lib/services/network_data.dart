import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_api/model/weather.dart';

class NetworkData {
  final String url;

  NetworkData({required this.url});

  Future getWeatherData(BuildContext context) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      return Weather.fromJson(jsonDecode(data));
    } else {
      print(response.statusCode);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: Text(
            'Location is not found!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          // action: SnackBarAction(label: 'label', onPressed: (){}),
          // elevation: 2.0,
          backgroundColor: Colors.yellow,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future getForecastData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(
      //       'something went wrong!',
      //       style: TextStyle(
      //         fontSize: 16,
      //         fontWeight: FontWeight.w400,
      //         color: Colors.black,
      //       ),
      //     ),
      //     // elevation: 2.0,
      //     backgroundColor: Colors.yellow,
      //     behavior: SnackBarBehavior.floating,
      //   ),
      // );
    }
  }
}
