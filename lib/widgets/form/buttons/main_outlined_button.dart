import 'package:flutter/material.dart';

class MainOutlinedButton extends StatelessWidget {
  final Text label;
  final IconData icon;
  final VoidCallback action;
  const MainOutlinedButton(
      {super.key,
      required this.label,
      required this.icon,
      required this.action});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
      onPressed: action,
      icon: Icon(icon),
      label: label,
    );
  }
}
