import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:goly/utils/constants.dart';
import 'package:goly/utils/router.dart';
import 'package:goly/utils/theme/dark_mode.dart';
import 'package:goly/utils/theme/light_mode.dart';
import 'package:goly/utils/utils.dart';
import 'package:goly/view_models/theme_view_model.dart';
import 'package:provider/provider.dart';
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

    return ChangeNotifierProvider (
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp.router(
          routerConfig: router,
          title: Constants.appName,
          //navigatorKey: navigatorKey,
          scaffoldMessengerKey: Utils.messangerKey,
          debugShowCheckedModeBanner: false,
          //themeMode: ThemeMode.system,
          theme: notifier.dark ? DarkMode.theme : LightMode.theme,
          //darkTheme: DarkMode.theme,
        );
        },
      ),
    );
  }
}

