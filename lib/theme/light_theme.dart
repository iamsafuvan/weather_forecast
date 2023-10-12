import 'package:flutter/material.dart';
import 'package:weather_app_api/res/constant/constant.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: const Color.fromARGB(255, 137, 198, 233),
    primary: cardColor,
    secondary: Colors.grey[800]!,
  ),
);
