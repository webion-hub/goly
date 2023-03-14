import 'package:flutter/material.dart';
import 'package:goly/widgets/layout/custom_divider.dart';

class SettingsListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool ifTrailing;
  final VoidCallback onTap;
  const SettingsListTile({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.ifTrailing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(icon),
        ),
        title: Text(
          text,
          style: const TextStyle(color: Colors.red),
        ),
        onTap: onTap,
        trailing: ifTrailing
            ? Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  Icons.chevron_right,
                ),
              )
            : null,
      ),
      const CustomDivider(),
    ]);
  }
}
