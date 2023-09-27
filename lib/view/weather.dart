import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rive/rive.dart';
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
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       'Weather',
            //       style: GoogleFonts.kanit(
            //         fontSize: 35,
            //         fontWeight: FontWeight.w700,
            //         color: Colors.white,
            //       ),
            //     ),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     Text(
            //       'Forecast...',
            //       style: GoogleFonts.lobster(
            //         fontSize: 35,
            //         fontWeight: FontWeight.w700,
            //         color: Colors.yellow,
            //       ),
            //     ),
            //   ],
            // ),
            // Image.asset(
            //   'assets/images/cloudy.png',
            //   height: 150,
            //   width: 150,
            // ),
            Container(
                width: 200,
                height: 200,
                child: RiveAnimation.network(
                  'https://public.rive.app/community/runtime-files/2741-5623-cloud-and-sun.riv',
                  fit: BoxFit.contain,
                )),
            // SizedBox(
            //   height: 30,
            // ),

            // SizedBox(
            //   height: 30,
            //   width: 30,
            //   child: const CircularProgressIndicator(
            //     color: Colors.yellow,
            //     strokeWidth: 4.0,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
