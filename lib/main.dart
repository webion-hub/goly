import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:goly/providers/user_provider.dart';
import 'package:goly/utils/constants.dart';
import 'package:goly/utils/router/router.dart';
import 'package:goly/utils/theme/dark_mode.dart';
import 'package:goly/utils/theme/light_mode.dart';
import 'package:goly/utils/utils.dart';
import 'package:goly/providers/theme_provider.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(initialDarkMode: false),
        ),
      ],
      child: Consumer<ThemeProvider>(
          builder: (context, ThemeProvider notifier, child) {
        return MaterialApp.router(
          routerConfig: router,
          title: Constants.appName,
          scaffoldMessengerKey: Utils.messangerKey,
          debugShowCheckedModeBanner: false,
          theme: notifier.dark ? DarkMode.theme : LightMode.theme,
        );
      }),
    );
  }
}
