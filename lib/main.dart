import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:goly/utils/constants.dart';
import 'package:goly/utils/router.dart';
import 'package:goly/utils/theme/dark_mode.dart';
import 'package:goly/utils/theme/light_mode.dart';
import 'package:goly/utils/utils.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //final introductionDone = prefs.getBool('introductionDone') ?? false;
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      routerConfig: router,
      title: Constants.appName,
      //navigatorKey: navigatorKey,
      scaffoldMessengerKey: Utils.messangerKey,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: LightMode.lightTheme,
      darkTheme: DarkMode.darkTheme,
    );
  }
}

