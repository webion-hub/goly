import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:goly/pages/auth_page.dart';
import 'package:goly/pages/home_page.dart';
import 'package:goly/pages/introduction_page.dart';
import 'package:goly/utils/constants.dart';
import 'package:goly/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final introductionDone = prefs.getBool('introductionDone') ?? false;
  await Firebase.initializeApp();
  runApp(MyApp(introductionDone: introductionDone));
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  final bool introductionDone;
  const MyApp({super.key, required this.introductionDone});
  
  @override
  Widget build(BuildContext context) {
    print(introductionDone);
    final  home = introductionDone  ? const MyHomePage() : const IntroductionPage();
    return MaterialApp(
      title: Constants.appName,
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: Utils.messangerKey,
      debugShowCheckedModeBanner: false,
      theme: (Constants.lightTheme),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          return snapshot.hasData
              ? home
              : const AuthPage();
        }),
      ),
    );
  }
}
