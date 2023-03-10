import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/models/settings.dart';
import 'package:goly/services/settings_service.dart';
import 'package:goly/providers/theme_provider.dart';
import 'package:goly/widgets/layout/indicators.dart';
import 'package:goly/widgets/list_tile/settings/settings_list_tile.dart';
import 'package:goly/widgets/settings/settings_switcher_list_tile.dart';
import 'package:goly/screens/auth/auth_screen.dart';
import 'package:goly/utils/constants.dart';
import 'package:provider/provider.dart';

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
            if (snapshot.connectionState == ConnectionState.waiting) {
              return buffering();
            }
            SettingsModel settings = snapshot.data!;

            return SingleChildScrollView(
              padding: Constants.pagePadding,
              child: Column(
                children: [
                  SettingsSwitcherListTile(
                    icon: Icons.lock,
                    initialValue: settings.privateAccount,
                    onChanged: (bool value) {
                      setState(() {
                        SettingsService.updateSettings(privateAccount: value);
                      });
                    },
                    text: "Private account",
                  ),
                  SettingsSwitcherListTile(
                    inactive: settings.privateAccount,
                    icon: Icons.lock,
                    initialValue: settings.privateAccount
                        ? true
                        : settings.privateGoalsByDefault,
                    onChanged: (bool value) {
                      SettingsService.updateSettings(
                          privateGoalsByDefault: value);
                    },
                    text: "Private goal by default",
                  ),
                  SettingsSwitcherListTile(
                    inactive: settings.privateAccount,
                    icon: Icons.lock,
                    initialValue: settings.privateAccount
                        ? true
                        : settings.privateRewardByDefault,
                    onChanged: (bool value) {
                      SettingsService.updateSettings(
                          privateRewardByDefault: value);
                    },
                    text: "Private reward by default",
                  ),
                  SettingsSwitcherListTile(
                    inactive: settings.privateAccount,
                    icon: Icons.lock,
                    initialValue: settings.privateAccount
                        ? true
                        : settings.privateDescriptionsByDefault,
                    onChanged: (bool value) {
                      SettingsService.updateSettings(
                          privateDescriptionsByDefault: value);
                    },
                    text: "Private description by default",
                  ),
                  Consumer(
                    builder: (context, ThemeProvider notifier, child) =>
                        SettingsSwitcherListTile(
                      icon: Icons.dark_mode,
                      initialValue: notifier.dark,
                      onChanged: (bool value) {
                        notifier.toggleTheme();
                      },
                      text: "Dark mode",
                    ),
                  ),
                  SettingsListTile(
                    icon: Icons.logout,
                    ifTrailing: false,
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      GoRouter.of(context).go(AuthScreen.routeName);
                    },
                    text: "Logout",
                  ),
                ],
              ),
            );
          }),
    );
  }
}
