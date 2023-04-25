import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/screens/main/profile/actions/report_screen.dart';
import 'package:goly/screens/main/profile/actions/settings_screen.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Profile'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () => GoRouter.of(context).push(ReportScreen.routeName),
          icon: const Icon(Icons.bug_report),
        ),
        IconButton(
          onPressed: () => GoRouter.of(context).push(SettingsScreen.routeName),
          icon: const Icon(Icons.settings),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
