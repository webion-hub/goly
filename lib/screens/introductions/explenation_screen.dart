import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/screens/main/friends/friends_Screen.dart';
import 'package:goly/utils/introductions.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExplenationScreen extends StatelessWidget {
  static const routeName = '/introduction';
  const ExplenationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: Introductions.welcome.map((e) {
        return PageViewModel(
            title: e.title,
            body: e.description,
            image: Center(
                child: Icon(
              e.icon,
              size: 70,
            )));
      }).toList(),
      showSkipButton: true,
      showNextButton: false,
      skip: const Text("Skip"),
      done: const Text("Done"),
      onDone: () async {
        try {
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('introductionDone', true);
        } finally {
          GoRouter.of(context).go(FriendsScreen.routeName);
        }
      },
    );
  }
}
