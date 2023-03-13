import 'package:flutter/material.dart';

class LightMode {
  static ThemeData theme = ThemeData.light().copyWith(
      useMaterial3: true,
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
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFA6EEFF),
    onSecondaryContainer: Color(0xFF001F25),
    tertiary: Color(0xFF3F6375),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFC3E8FE),
    onTertiaryContainer: Color(0xFF001E2B),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFBFDF9),
    onBackground: Color(0xFF191C1B),
    surface: Color(0xFFFBFDF9),
    onSurface: Color(0xFF191C1B),
    surfaceVariant: Color(0xFFDBE5DF),
    onSurfaceVariant: Color(0xFF404944),
    outline: Color(0xFF707974),
    onInverseSurface: Color(0xFFEFF1EE),
    inverseSurface: Color(0xFF2E312F),
    inversePrimary: Color(0xFF64DBB4),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF006C53),
    outlineVariant: Color(0xFFBFC9C3),
    scrim: Color(0xFF000000),
  );
  static const appBarTheme = AppBarTheme(
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
