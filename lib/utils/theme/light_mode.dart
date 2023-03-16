import 'package:flutter/material.dart';

class LightMode {
  static ThemeData theme = ThemeData.light().copyWith(
      useMaterial3: true,
      appBarTheme: appBarTheme,
      scaffoldBackgroundColor: Colors.white,
      colorScheme:
          lightColorScheme // ColorScheme.fromSeed(seedColor: Colors.teal),
      );

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF006C53),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFF81F8D0),
    onPrimaryContainer: Color(0xFF002117),
    secondary: Color(0xFF006878),
    onSecondary: Color.fromARGB(255, 234, 234, 234),
    secondaryContainer: Color(0xFFA6EEFF),
    onSecondaryContainer: Color(0xFF001F25),
    tertiary: Color(0xFF3F6375),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color.fromARGB(255, 195, 254, 222),
    onTertiaryContainer: Color(0xFF001E2B),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFBFDF9),
    onBackground: Color(0xFF191C1B),
    surface: Color.fromARGB(255, 255, 255, 255),
    onSurface: Color(0xFF191C1B),
    surfaceVariant: Color.fromARGB(255, 255, 255, 255),
    onSurfaceVariant: Color(0xFF404944),
    outline: Color.fromARGB(255, 205, 205, 205),
    onInverseSurface: Color(0xFFEFF1EE),
    inverseSurface: Color(0xFF2E312F),
    inversePrimary: Color(0xFF64DBB4),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF006C53),
    outlineVariant: Color(0xFFBFC9C3),
    scrim: Color(0xFF000000),
  );
  static const appBarTheme = AppBarTheme(
    surfaceTintColor: Colors.transparent,
    elevation: 0.0,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    toolbarTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
    ),
  );
}
