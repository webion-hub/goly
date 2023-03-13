import 'package:flutter/material.dart';

class DarkMode {
  static ThemeData theme = ThemeData.dark().copyWith(
    useMaterial3: true,
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: darkColorScheme,
    appBarTheme: appBarTheme,
  );

  ///Colors for dark mode
  static Color backgroundColor = const Color.fromARGB(255, 0, 0, 0);
  static Color primaryColor = const Color(0xFF006C47);
  static Color secondaryColor = const Color.fromARGB(255, 150, 150, 150);

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF64DBB4),
    onPrimary: Color(0xFF00382A),
    primaryContainer: Color(0xFF00513E),
    onPrimaryContainer: Color(0xFF81F8D0),
    secondary: Color.fromARGB(255, 116, 169, 139),
    onSecondary: Color(0xFF00363F),
    secondaryContainer: Color(0xFF004E5B),
    onSecondaryContainer: Color(0xFFA6EEFF),
    tertiary: Color(0xFFA7CCE1),
    onTertiary: Color(0xFF0B3445),
    tertiaryContainer: Color(0xFF274B5D),
    onTertiaryContainer: Color(0xFFC3E8FE),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF191C1B),
    onBackground: Color(0xFFE1E3E0),
    surface: Color(0xFF191C1B),
    onSurface: Color(0xFFE1E3E0),
    surfaceVariant: Color(0xFF404944),
    onSurfaceVariant: Color(0xFFBFC9C3),
    outline: Color(0xFF89938D),
    onInverseSurface: Color(0xFF191C1B),
    inverseSurface: Color(0xFFE1E3E0),
    inversePrimary: Color(0xFF006C53),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF64DBB4),
    outlineVariant: Color(0xFF404944),
    scrim: Color(0xFF000000),
  );

  static final appBarTheme = AppBarTheme(
    elevation: 0.0,
    backgroundColor: backgroundColor,
    surfaceTintColor: Colors.transparent,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
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
