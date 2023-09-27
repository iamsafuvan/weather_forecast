import 'package:weather_app_api/res/constant/constant.dart';
import 'package:weather_app_api/services/location.dart';
import 'package:weather_app_api/services/network_data.dart';

class WeatherRepository {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$weatherApiUrl?q=$cityName&appid=$apiKey&units=metric';

    NetworkData networkHelper = NetworkData(url: url);

    var weatherData = networkHelper.getWeatherData();

    return weatherData;
  }

  Future<dynamic> getCurrentLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    var url =
        '$weatherApiUrl?lat=${location.latitude}&lon=${location.longitide}&appid=$apiKey&units=metric';
    NetworkData networkHelper = NetworkData(url: url);
    var weatherData = await networkHelper.getWeatherData();

    return weatherData;
  }

  Future<dynamic> getForcastWeather(String cityName) async {
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

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'assets/images/cloudy.png';
    } else if (condition < 400) {
      return 'assets/images/rainy-day.png';
    } else if (condition < 600) {
      return 'assets/images/storm.png';
    } else if (condition < 700) {
      return 'assets/images/snow.png';
    } else if (condition < 800) {
      return 'assets/images/wind.png';
    } else if (condition == 800) {
      return 'assets/images/sun.png';
    } else if (condition <= 804) {
      return 'assets/images/cloud.png';
    } else {
      return 'assets/images/warning.png';
    }
  }

  // String getMessage(int temp) {
  //   if (temp > 25) {
  //     return 'It\'s 🍦 time';
  //   } else if (temp > 20) {
  //     return 'Time for shorts and 👕';
  //   } else if (temp < 10) {
  //     return 'You\'ll need 🧣 and 🧤';
  //   } else {
  //     return 'Bring a 🧥 just in case';
  //   }
  // }
}
