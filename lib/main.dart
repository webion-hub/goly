import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:goly/pages/auth/auth_page.dart';
import 'package:goly/pages/app.dart';
import 'package:goly/pages/auth/forgot_password_page.dart';
import 'package:goly/pages/introductions/introduction_page.dart';
import 'package:goly/pages/main/goals/add_category_page.dart';
import 'package:goly/pages/main/recent_conversations.dart';
import 'package:goly/pages/main/discover_page.dart';
import 'package:goly/pages/main/goals_page.dart';
import 'package:goly/pages/main/profile_page.dart';
import 'package:goly/pages/main/settings_page.dart';
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
    final  home = introductionDone  ? const App() : const IntroductionPage();

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
            : const AuthPage();
        }),
      ),
      routes: {
        AuthPage.routeName: ((context) => const AuthPage()),
        ForgotPasswordPage.routeName: ((context) => const ForgotPasswordPage()),
        IntroductionPage.routeName: ((context) => const IntroductionPage()),
        DiscoverPage.routeName: ((context) => const DiscoverPage()),
        GoalsPage.routeName: ((context) => const GoalsPage()),
        ProfilePage.routeName: ((context) => ProfilePage(profileId: Utils.currentUid(),)),
        SettingsPage.routeName: ((context) => const SettingsPage()),
        RecentConversations.routeName: ((context) => const RecentConversations()),
        AddCategoryPage.routeName: ((context) => const AddCategoryPage()),
      },
    );
  }
}
