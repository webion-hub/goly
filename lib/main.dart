import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:goly/screens/auth/auth_screen.dart';
import 'package:goly/screens/app.dart';
import 'package:goly/screens/auth/forgot_password_screen.dart';
import 'package:goly/screens/introductions/introduction_screen.dart';
import 'package:goly/screens/main/goals/actions/category/handle_category_screen.dart';
import 'package:goly/screens/main/discover/actions/recent_conversations_screen.dart';
import 'package:goly/screens/main/discover/discover_screen.dart';
import 'package:goly/screens/main/goals/goals_screen.dart';
import 'package:goly/screens/main/profile/profile_screen.dart';
import 'package:goly/screens/main/profile/actions/settings_screen.dart';
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
    final home = introductionDone ? const App() : const IntroductionPage();

    return MaterialApp(
      title: Constants.appName,
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: Utils.messangerKey,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((BuildContext context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? const CircularProgressIndicator()
              : snapshot.hasData
                  ? home
                  : const AuthScreen();
        }),
      ),
      routes: {
        AuthScreen.routeName: ((context) => const AuthScreen()),
        ForgotPasswordScreen.routeName: ((context) => const ForgotPasswordScreen()),
        IntroductionPage.routeName: ((context) => const IntroductionPage()),
        DiscoverScreen.routeName: ((context) => const DiscoverScreen()),
        GoalsScreen.routeName: ((context) => const GoalsScreen()),
        ProfileScreen.routeName: ((context) => ProfileScreen(
              profileId: Utils.currentUid(),
            )),
        SettingsScreen.routeName: ((context) => const SettingsScreen()),
        RecentConversationsScreen.routeName: ((context) =>
            const RecentConversationsScreen()),
        HandleCategoryScreen.routeName: ((context) => const HandleCategoryScreen()),
      },
    );
  }
}
