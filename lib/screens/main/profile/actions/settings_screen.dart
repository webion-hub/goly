import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/models/settings.dart';
import 'package:goly/services/settings_service.dart';
import 'package:goly/view_models/theme_view_model.dart';
import 'package:goly/widgets/settings/settings_list_tile.dart';
import 'package:goly/widgets/settings/settings_switcher.dart';
import 'package:goly/screens/auth/auth_screen.dart';
import 'package:goly/utils/constants.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('settings')),
      body: FutureBuilder<SettingsModel>(
          future: SettingsService.getCurrentSettings(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            SettingsModel settings = snapshot.data!;

            return SingleChildScrollView(
              padding: Constants.pagePadding,
              child: Column(
                children: [
                  SettingsSwitcher(
                    icon: Icons.lock,
                    initialValue: settings.privateAccount,
                    onChanged: (bool value) {
                      SettingsService.updateSettings(privateAccount: value);
                    },
                    text: "Private account",
                  ),
                  SettingsSwitcher(
                    icon: Icons.lock,
                    initialValue: settings.privateGoalsByDefault,
                    onChanged: (bool value) {
                      SettingsService.updateSettings(
                          privateGoalsByDefault: value);
                    },
                    text: "Private goal by default",
                  ),
                  SettingsSwitcher(
                    icon: Icons.lock,
                    initialValue: settings.privateRewardByDefault,
                    onChanged: (bool value) {
                      SettingsService.updateSettings(
                          privateRewardByDefault: value);
                    },
                    text: "Private reward by default",
                  ),
                  SettingsSwitcher(
                    icon: Icons.lock,
                    initialValue: settings.privateDescriptionsByDefault,
                    onChanged: (bool value) {
                      SettingsService.updateSettings(
                          privateDescriptionsByDefault: value);
                    },
                    text: "Private description by default",
                  ),
                  Consumer(
                    builder:(context, ThemeNotifier notifier, child) => SettingsSwitcher(
                      icon: Icons.dark_mode,
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
