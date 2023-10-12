import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app_api/repository/weather_model.dart';
import 'package:weather_app_api/theme/dark_theme.dart';
import 'package:weather_app_api/view/home_page.dart';

class Starter extends StatefulWidget {
  // Weather({Key key}) : super(key: key);

  @override
  _StarterState createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  void initState() {
    getLocationData();
    super.initState();
  }

  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  getLocationData() async {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
      if (isDeviceConnected == true) {
        WeatherRepository weatherModel = WeatherRepository();
        var status = await Permission.location.status;
        if (status.isPermanentlyDenied) {
          await Geolocator.openLocationSettings();
        } else {
          await Permission.location.request();
        }
        var weatherData = await weatherModel.getCurrentLocation(context);
        var forecastData = await weatherModel.getCurrentForecastWeather();
        // Future.delayed(const Duration(seconds: 2));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              locationWeather: weatherData,
              forecastWeather: forecastData,
            ),
          ),
        );
      } else if (!isDeviceConnected && isAlertSet == false) {
        // print('internet is off');
        // showDialogBox();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            showCloseIcon: true,
            duration: Duration(seconds: 10),
            closeIconColor: Colors.black,
            content: Text(
              'Please check your connection',
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
          ),
        );
        setState(() {
          isAlertSet = true;
        });
      } else {
        print('Not Worked');
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var currentHour = DateFormat.H().format(DateTime.now());

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child:
                    int.parse(currentHour) >= 18 || int.parse(currentHour) <= 6
                        ? Image.asset('assets/images/night.gif')
                        : Image.asset('assets/images/sun.gif'),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ));
  }

  // showDialogBox() => showCupertinoDialog<String>(
  //       context: context,
  //       builder: (BuildContext context) => CupertinoAlertDialog(
  //         title: const Text('No Connection'),
  //         content: const Text('Please check your internet connectivity'),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () async {
  //               Navigator.pop(context, 'Cancel');
  //               setState(() => isAlertSet = false);
  //               isDeviceConnected =
  //                   await InternetConnectionChecker().hasConnection;
  //               if (!isDeviceConnected && isAlertSet == false) {
  //                 showDialogBox();
  //                 setState(() => isAlertSet = true);
  //               }
  //             },
  //             child: const Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
}
