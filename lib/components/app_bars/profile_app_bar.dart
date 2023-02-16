import 'package:flutter/material.dart';
import 'package:goly/pages/main/profile/settings_page.dart';
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
              Navigator.of(context).pushNamed(SettingsPage.routeName),
          icon: const Icon(Icons.settings),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
