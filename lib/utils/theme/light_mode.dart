import 'package:flutter/material.dart';

class LightMode {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    backgroundColor: backgroundColor,
    primaryColor: primaryColor,
    secondaryHeaderColor: secondaryColor,
    colorScheme: lightColorScheme,
    appBarTheme:  appBarTheme,
  );
  
  ///Colors for light mode
  static Color backgroundColor = const Color.fromARGB(255, 255, 255, 255);
  static Color primaryColor = const Color(0xff00ffab);
  static Color secondaryColor = const Color.fromARGB(255, 150, 150, 150);

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF006C47),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFF8EF7C0),
    onPrimaryContainer: Color(0xFF002112),
    secondary: Color(0xFF4D6356),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD0E8D7),
    onSecondaryContainer: Color(0xFF0B1F15),
    tertiary: Color(0xFF3C6472),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFC0E9FA),
    onTertiaryContainer: Color(0xFF001F28),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFBFDF8),
    onBackground: Color(0xFF191C1A),
    surface: Color(0xFFFBFDF8),
    onSurface: Color(0xFF191C1A),
    surfaceVariant: Color(0xFFDCE5DC),
    onSurfaceVariant: Color(0xFF404943),
    outline: Color(0xFF707972),
    onInverseSurface: Color(0xFFEFF1ED),
    inverseSurface: Color(0xFF2E312E),
    inversePrimary: Color(0xFF72DAA6),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF006C47),
  );

  static final appBarTheme = AppBarTheme(
    elevation: 0.0,
    backgroundColor: backgroundColor,
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
  );

}
