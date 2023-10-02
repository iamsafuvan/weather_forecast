import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app_api/repository/weather_model.dart';
import 'package:weather_app_api/res/constant/constant.dart';
import 'package:weather_app_api/view/home_page.dart';

class Starter extends StatefulWidget {
  // Weather({Key key}) : super(key: key);

  @override
  _StarterState createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  void initState() {
    super.initState();
    getLocationData();
  }

  getLocationData() async {
    WeatherRepository weatherModel = WeatherRepository();
    var status = await Permission.location.status;
    if (status.isPermanentlyDenied) {
      await Geolocator.openLocationSettings();
    } else {
      await Permission.location.request();
    }
    var weatherData = await weatherModel.getCurrentLocation();
    var forecastData = await weatherModel.getCurrentForecastWeather();
    Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  locationWeather: weatherData,
                  forecastWeather: forecastData,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              child: Image.asset('assets/images/foggy.gif'),
            ),
            SizedBox(
              height: 100,
            ),
           
          ],
        ),
      ),
    );
  }
}
