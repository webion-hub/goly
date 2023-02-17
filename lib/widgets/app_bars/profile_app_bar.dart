import 'package:flutter/material.dart';
import 'package:goly/screens/main/profile/actions/settings_screen.dart';
import 'package:goly/utils/constants.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(Constants.appName.toUpperCase()),
      actions: [
        IconButton(
          onPressed: () =>
              Navigator.of(context).pushNamed(SettingsScreen.routeName),
          icon: const Icon(Icons.settings),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
