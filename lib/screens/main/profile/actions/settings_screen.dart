import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goly/widgets/settings/settings_list_tile.dart';
import 'package:goly/widgets/settings/settings_switcher.dart';
import 'package:goly/screens/auth/auth_screen.dart';
import 'package:goly/utils/constants.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('settings')),
      body: Container(
        padding: Constants.pagePadding,
        child: Column(
          children: [
            SettingsSwitcher(
              icon: Icons.lock,
              onChanged: (bool a) {},
              text: "Private account",
            ),
            SettingsSwitcher(
              icon: Icons.lock,
              onChanged: (bool a) {},
              text: "Private goal by default",
            ),
            SettingsSwitcher(
              icon: Icons.lock,
              onChanged: (bool a) {},
              text: "Private reward by default",
            ),
            SettingsSwitcher(
              icon: Icons.lock,
              onChanged: (bool a) {},
              text: "Private description by default",
            ),
            SettingsSwitcher(
              icon: Icons.dark_mode,
              onChanged: (bool a) {},
              text: "Change theme",
            ),
            SettingsListTile(
              icon: Icons.logout,
              ifTrailing: false,
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
              },
              text: "Logout",
            ),
          ],
        ),
      ),
    );
  }
}
