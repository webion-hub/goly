import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goly/models/settings.dart';
import 'package:goly/services/settings_service.dart';
import 'package:goly/widgets/settings/settings_list_tile.dart';
import 'package:goly/widgets/settings/settings_switcher.dart';
import 'package:goly/screens/auth/auth_screen.dart';
import 'package:goly/utils/constants.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('settings')),
      body: FutureBuilder<SettingsModel>(
        future: SettingsService.getCurrentSettings(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          SettingsModel settings = snapshot.data!;

          return Container(
            padding: Constants.pagePadding,
            child: Column(
              children: [
                SettingsSwitcher(
                  icon: Icons.lock,
                  initialValue: settings.privateAccount,
                  onChanged: (bool value) {
                    SettingsService.updateSettings(settings: SettingsModel(privateAccount: value, privateDescriptionsByDefault: settings.privateDescriptionsByDefault, privateGoalsByDefault: settings.privateDescriptionsByDefault, privateRewardByDefault: settings.privateDescriptionsByDefault));
                    setState(() {});
                  },
                  text: "Private account",
                ),
                SettingsSwitcher(
                  icon: Icons.lock,
                  initialValue:  settings.privateGoalsByDefault,
                  onChanged: (bool value) {
                    SettingsService.updateSettings(settings: SettingsModel(privateAccount: settings.privateAccount, privateDescriptionsByDefault: settings.privateDescriptionsByDefault, privateGoalsByDefault: value, privateRewardByDefault: settings.privateDescriptionsByDefault));
                    setState(() {});
                  },
                  text: "Private goal by default",
                ),
                SettingsSwitcher(
                  icon: Icons.lock,
                  initialValue:  settings.privateRewardByDefault,
                  onChanged: (bool value) {
                    SettingsService.updateSettings(settings: SettingsModel(privateAccount: settings.privateAccount, privateDescriptionsByDefault: settings.privateDescriptionsByDefault, privateGoalsByDefault: settings.privateGoalsByDefault, privateRewardByDefault: value));
                    setState(() {});
                  },
                  text: "Private reward by default",
                ),
                SettingsSwitcher(
                  icon: Icons.lock,
                  initialValue:  settings.privateDescriptionsByDefault,
                  onChanged: (bool value) {
                    SettingsService.updateSettings(settings: SettingsModel(privateAccount: settings.privateAccount, privateDescriptionsByDefault: value, privateGoalsByDefault: settings.privateGoalsByDefault, privateRewardByDefault: settings.privateRewardByDefault));
                    setState(() {});
                  },
                  text: "Private description by default",
                ),
                SettingsSwitcher(
                  icon: Icons.dark_mode,
                  onChanged: (bool value) {},
                  text: "Dark mode",
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
          );
        }
      ),
    );
  }
}
