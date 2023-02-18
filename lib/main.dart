import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:goly/responsive/mobile_screen_layout.dart';
import 'package:goly/responsive/responsive_layout.dart';
import 'package:goly/responsive/web_screen_layout.dart';
import 'package:goly/screens/auth/auth_screen.dart';
import 'package:goly/screens/auth/forgot_password_screen.dart';
import 'package:goly/screens/introductions/introduction_screen.dart';
import 'package:goly/screens/main/goals/actions/category/handle_category_screen.dart';
import 'package:goly/screens/main/discover/actions/recent_conversations_screen.dart';
import 'package:goly/screens/main/discover/discover_screen.dart';
import 'package:goly/screens/main/goals/goals_screen.dart';
import 'package:goly/screens/main/profile/profile_screen.dart';
import 'package:goly/screens/main/profile/actions/settings_screen.dart';
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
      //home: Home(),
      // routes: {
      //   AuthScreen.routeName: ((context) => const AuthScreen()),
      //   ForgotPasswordScreen.routeName: ((context) => const ForgotPasswordScreen()),
      //   IntroductionPage.routeName: ((context) => const IntroductionPage()),
      //   DiscoverScreen.routeName: ((context) => const DiscoverScreen()),
      //   GoalsScreen.routeName: ((context) => const GoalsScreen()),
      //   ProfileScreen.routeName: ((context) => ProfileScreen(
      //         profileId: Utils.currentUid(),
      //       )),
      //   SettingsScreen.routeName: ((context) => const SettingsScreen()),
      //   RecentConversationsScreen.routeName: ((context) =>
      //       const RecentConversationsScreen()),
      //   HandleCategoryScreen.routeName: ((context) => const HandleCategoryScreen()),
      // },
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            // Checking if the snapshot has any data or not
            if (snapshot.hasData) {
              // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
              return const ResponsiveLayout(
                mobileScreenLayout: MobileScreenLayout(),
                webScreenLayout: WebScreenlayout(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
          }

          // means connection to future hasnt been made yet
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return const AuthScreen();
      }),
    );
  }
}
