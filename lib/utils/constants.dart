import 'package:flutter/material.dart';

class Constants {
  static String appName = "Goly";

  static Color lightPrimary = Color.fromARGB(255, 14, 14, 14);
  static Color darkPrimary = Color.fromARGB(255, 150, 150, 150);

  static Color lightAccent = const Color(0xff00ffab);
  static Color darkAccent = const Color(0xff00ffab);

  static Color lightBG = const Color(0xffffffff);
  static Color darkBG = const Color(0xff000000);

  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.green,
    iconTheme: const IconThemeData(color: Colors.black),
    backgroundColor: lightBG,
    inputDecorationTheme: InputDecorationTheme(
        focusColor: darkBG,
        fillColor: darkBG,
        iconColor: Colors.black,
        suffixIconColor: Colors.black,
        prefixIconColor: Colors.black),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: lightAccent,
    ),
    primaryColor: Colors.black,
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
      primary: lightPrimary,
      secondary: lightAccent,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    iconTheme: const IconThemeData(color: Colors.white),
    colorScheme: ColorScheme.fromSwatch(
      accentColor: darkAccent,
    ).copyWith(
      primary: lightPrimary,
      secondary: darkAccent,
      brightness: Brightness.dark,
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusColor: lightBG,
      fillColor: lightBG,
    ),
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    scaffoldBackgroundColor: darkBG,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: darkAccent,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      elevation: 0,
      color: darkBG,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: darkBG,
      iconTheme: const IconThemeData(color: Colors.white),
      toolbarTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
      ),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
