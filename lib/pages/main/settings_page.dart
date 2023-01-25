import 'package:flutter/material.dart';
import 'package:goly/components/settings/settings_list_tile.dart';
import 'package:goly/utils/constants.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('settings')),
      body: const SingleChildScrollView(
          padding: Constants.pagePadding,
          child: SettingsListTile(
            icon: Icons.logout,
            ifTrailing: false,
            text: "Logout",
          )),
    );
  }
}
