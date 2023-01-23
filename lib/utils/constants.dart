import 'package:flutter/material.dart';

class Constants {
  static String appName = "Goly";
    static Color lightPrimary = const Color(0xff14c38f);
  static Color darkPrimary = const Color(0xff2B2B2B);

  static Color lightAccent = const Color(0xff00ffab);

  static Color darkAccent = Color(0xff00ffab);

  static Color lightBG = const Color(0xffffffff);
  static Color darkBG = const Color(0xff000000);

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: lightAccent,
    ),
    scaffoldBackgroundColor: lightBG,
    bottomAppBarTheme: BottomAppBarTheme(
      elevation: 0,
      color: lightBG,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: lightBG,
      iconTheme: const IconThemeData(color: Colors.black),
      toolbarTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
      ),
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: lightAccent,
    ),
  );

}