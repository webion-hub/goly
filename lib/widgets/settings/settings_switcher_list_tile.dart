import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsSwitcherListTile extends StatefulWidget {
  final IconData icon;
  final String text;
  final String? subtitle;
  final Function(bool) onChanged;
  final bool initialValue;

  const SettingsSwitcherListTile({
    super.key,
    this.initialValue = false,
    required this.icon,
    required this.text,
    this.subtitle,
    required this.onChanged,
  });

  @override
  State<SettingsSwitcherListTile> createState() => _SettingsSwitcherListTileState();
}

class _SettingsSwitcherListTileState extends State<SettingsSwitcherListTile> {
  late bool currentValue = widget.initialValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(widget.icon),
          ),
          title: Text(
            widget.text,
          ),
          subtitle: widget.subtitle != null ? Text(widget.subtitle!) : null,
          trailing: CupertinoSwitch(
            onChanged: (value) {
              widget.onChanged(value);
              setState(() {
                currentValue = value;
              });
            },
            value: currentValue,
          ),
        ),
        const Divider(),
      ],
    );
  }
}
