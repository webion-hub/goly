import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/screens/main/goals/goals_screen.dart';
import 'package:goly/utils/introductions.dart';
import 'package:introduction_screen/introduction_screen.dart';

class ExplenationScreen extends StatelessWidget {
  static const routeName = '/introduction';
  const ExplenationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: Introductions.welcome.map((e) {
        return PageViewModel(
          decoration: PageDecoration(
            bodyTextStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          title: e.title,
          body: e.description,
          image: Center(
            child: Icon(
              e.icon,
              size: 70,
            ),
          ),
        );
      }).toList(),
      showSkipButton: true,
      showNextButton: false,
      skip: const Text("Skip"),
      done: const Text("Done"),
      onDone: () => GoRouter.of(context).go(GoalsScreen.routeName),
    );
  }
}
