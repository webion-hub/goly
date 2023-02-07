import 'package:flutter/material.dart';
import 'package:goly/components/settings/settings_list_tile.dart';
import 'package:goly/components/settings/settings_switcher.dart';
import 'package:goly/utils/constants.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings';
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('settings')),
      body: SingleChildScrollView(
        padding: Constants.pagePadding,
        child: Column(
          children: [
            SettingsSwitcher(
              icon: Icons.lock,
              onChanged: (bool a) {},
              text: "All goals private as default",
            ),
            SettingsSwitcher(
              icon: Icons.lock,
              onChanged: (bool a) {},
              text: "Private Account",
            ),
            SettingsSwitcher(
              icon: Icons.dark_mode,
              onChanged: (bool a) {},
              text: "Change theme",
            ),
            SettingsListTile(
              icon: Icons.logout,
              ifTrailing: false,
              onTap: () {},
              text: "Logout",
            ),
          ],
        ),
      ),
    );
  }
}
