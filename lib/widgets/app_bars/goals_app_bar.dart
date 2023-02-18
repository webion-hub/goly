import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goly/screens/introductions/introduction_screen.dart';

class GoalsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GoalsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Goals'),
      actions: [
        IconButton(
            onPressed: () => Navigator.of(context).push(CupertinoPageRoute(
                  builder: ((context) => const IntroductionPage()),
                  maintainState: false,
                )),
            icon: const Icon(Icons.question_mark_rounded)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
