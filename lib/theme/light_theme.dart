import 'package:flutter/material.dart';
import 'package:weather_app_api/res/constant/constant.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Color.fromARGB(255, 133, 197, 234),
    primary: cardColor,
    secondary: Colors.grey[800]!,
    // shadow: Colors.grey,
  ),
  
);
