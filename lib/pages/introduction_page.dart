import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Welcome to Goly",
          body: "Welcome to the app! This is a description of how it works.",
          image: Center(
            child: Icon(Icons.waving_hand,
                size: 70.0, color: Theme.of(context).primaryColor),
          ),
        ),
        PageViewModel(
          title: "Why Goly",
          body:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra in massa a aliquam. Integer tincidunt enim et lectus varius, a vehicula urna volutpat. Praesent placerat leo sit amet lacus varius, quis congue est elementum.  ",
          image: Center(
            child: Icon(Icons.question_mark_rounded,
                size: 70.0, color: Theme.of(context).primaryColor),
          ),
        ),
        PageViewModel(
          title: "How it works",
          body:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra in massa a aliquam. Integer tincidunt enim et lectus varius, a vehicula urna volutpat. Praesent placerat leo sit amet lacus varius, quis congue est elementum.  ",
          image: Center(
            child: Icon(Icons.settings,
                size: 70.0, color: Theme.of(context).primaryColor),
          ),
        ),
      ],
      showSkipButton: true,
      showNextButton: false,
      skip: const Text("Skip"),
      done: const Text("Done"),
      onDone: () {
        // On button pressed
        Navigator.of(context).pushReplacementNamed('/');
      },
    );
  }
}
