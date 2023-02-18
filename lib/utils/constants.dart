import 'package:flutter/material.dart';
import 'package:goly/utils/theme/dark_mode.dart';
import 'package:goly/utils/theme/light_mode.dart';

class Constants {
  static String appName = "Goly";
  static String userImageDefault = 'assets/images/user.jpeg';
  
  static const pagePadding = EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0);

  static ThemeData lightTheme = ThemeData.light().copyWith(
    backgroundColor: LightMode.backgroundColor,
    primaryColor: LightMode.primaryColor,
    secondaryHeaderColor: LightMode.secondaryColor,
    colorScheme: LightMode.lightColorScheme,
    
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: DarkMode.backgroundColor,
    primaryColor: DarkMode.primaryColor,
    secondaryHeaderColor: DarkMode.secondaryColor,
    colorScheme: DarkMode.darkColorScheme,
  );

}