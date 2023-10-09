import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_api/theme/change_theme.dart';
import 'package:weather_app_api/theme/dark_theme.dart';
import 'package:weather_app_api/theme/light_theme.dart';
import 'package:weather_app_api/view/weather.dart';

// StreamController<DateTime> currentTime = StreamController();
void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> ChangeTheme()),
      
    ],
    child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var currentHour = DateFormat.H().format(DateTime.now());

    return MaterialApp(
      themeMode: Provider.of<ChangeTheme>(context).theme,
      theme: int.parse(currentHour) >= 18 || int.parse(currentHour) <= 6
          ? darkTheme
          : lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Starter(),
    );
  }
}
