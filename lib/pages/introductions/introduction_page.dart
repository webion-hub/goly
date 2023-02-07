import 'package:flutter/cupertino.dart';
import 'package:goly/components/instructions/step_1.dart';
import 'package:goly/components/instructions/step_2.dart';
import 'package:goly/components/instructions/step_3.dart';
import 'package:goly/pages/app.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      onDone: () async {
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('introductionDone', true);
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
          CupertinoPageRoute(
            builder: (_) => const App(),
          ),
        );
      },
    );
  }
}
