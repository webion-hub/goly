import 'package:flutter/material.dart';
import 'package:goly/pages/introductions/introduction_page.dart';

class GoalsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GoalsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Goals'),
      actions: [
        IconButton(onPressed: () => Navigator.of(context).pushNamed(IntroductionPage.routeName), icon: const Icon(Icons.question_mark_rounded)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
