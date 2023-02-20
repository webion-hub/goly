import 'package:flutter/material.dart';

class DarkMode {
  static ThemeData theme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: DarkMode.backgroundColor,
    primaryColor: DarkMode.primaryColor,
    secondaryHeaderColor: DarkMode.secondaryColor,
    colorScheme: DarkMode.darkColorScheme,
    appBarTheme: appBarTheme,
  );
  
  ///Colors for dark mode
  static Color backgroundColor = const Color.fromARGB(255, 0, 0, 0);
  static Color primaryColor = const Color(0xff00ffab);
  static Color secondaryColor = const Color.fromARGB(255, 150, 150, 150);

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF72DAA6),
    onPrimary: Color(0xFF003823),
    primaryContainer: Color(0xFF005234),
    onPrimaryContainer: Color(0xFF8EF7C0),
    secondary: Color(0xFFB4CCBC),
    onSecondary: Color(0xFF203529),
    secondaryContainer: Color(0xFF364B3F),
    onSecondaryContainer: Color(0xFFD0E8D7),
    tertiary: Color(0xFFA4CDDD),
    onTertiary: Color(0xFF053542),
    tertiaryContainer: Color(0xFF234C59),
    onTertiaryContainer: Color(0xFFC0E9FA),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF191C1A),
    onBackground: Color(0xFFE1E3DF),
    surface: Color(0xFF191C1A),
    onSurface: Color(0xFFE1E3DF),
    surfaceVariant: Color(0xFF404943),
    onSurfaceVariant: Color(0xFFC0C9C1),
    outline: Color(0xFF8A938C),
    onInverseSurface: Color(0xFF191C1A),
    inverseSurface: Color(0xFFE1E3DF),
    inversePrimary: Color(0xFF006C47),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF72DAA6),
);

  static final appBarTheme = AppBarTheme(
    elevation: 0.0,
    backgroundColor: backgroundColor,
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
  );

}