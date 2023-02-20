import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/screens/main/discover/discover_screen.dart';
import 'package:goly/widgets/instructions/step_1.dart';
import 'package:goly/widgets/instructions/step_2.dart';
import 'package:goly/widgets/instructions/step_3.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExplenationScreen extends StatelessWidget {
  static const routeName = '/introduction';
  const ExplenationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        step1,
        step2,
        step3,
      ],
      showSkipButton: true,
      showNextButton: false,
      skip: const Text("Skip"),
      done: const Text("Done"),
      onDone: () async {
        try {
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('introductionDone', true);
        } finally {
          GoRouter.of(context).go(DiscoverScreen.routeName);
        }
      },
    );
  }
}
