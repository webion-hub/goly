import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goly/components/page_view_models/step_1.dart';
import 'package:goly/components/page_view_models/step_2.dart';
import 'package:goly/components/page_view_models/step_3.dart';
import 'package:goly/pages/home_page.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

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
      onDone: () {
        // On button pressed
        Navigator.of(context).pushReplacement(
          CupertinoPageRoute(
            builder: (_) => const MyHomePage(),
          ),
        );
      },
    );
  }
}
