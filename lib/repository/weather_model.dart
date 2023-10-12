

import 'package:flutter/cupertino.dart';
import 'package:weather_app_api/res/constant/constant.dart';
import 'package:weather_app_api/services/location.dart';
import 'package:weather_app_api/services/network_data.dart';

class WeatherRepository {
  Future<dynamic> getCityWeather(String cityName, BuildContext context) async {
    var url = '$weatherApiUrl?q=$cityName&appid=$apiKey&units=metric';

    NetworkData networkHelper = NetworkData(url: url);

    var weatherData = networkHelper.getWeatherData(context);

    return weatherData;
  }

  Future<dynamic> getCurrentLocation(BuildContext context) async {
    Location location = Location();
    await location.getCurrentLocation();
    var url =
        '$weatherApiUrl?lat=${location.latitude}&lon=${location.longitide}&appid=$apiKey&units=metric';
    NetworkData networkHelper = NetworkData(url: url);
    var weatherData = await networkHelper.getWeatherData(context);

    return weatherData;
  }

  Future<dynamic> getForcastWeather(String cityName ) async {
    Location location = Location();
    await location.getLocationDetails(cityName);
    var url =
        '$forecastApiUrl?lat=${location.latitude}&lon=${location.longitide}&appid=$onecallApiKey&units=metric';

    NetworkData networkHelper = NetworkData(url: url);

    var weatherData = await networkHelper.getForecastData();

    return weatherData;
  }

  Future<dynamic> getCurrentForecastWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    var url =
        '$forecastApiUrl?lat=${location.latitude}&lon=${location.longitide}&appid=$onecallApiKey&units=metric';
    NetworkData networkHelper = NetworkData(url: url);
    var weatherData = await networkHelper.getForecastData();

    return weatherData;
  }
}
