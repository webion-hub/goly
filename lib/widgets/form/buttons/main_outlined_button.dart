import 'package:flutter/material.dart';

class MainOutlinedButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback action;
  final bool fullWidth;
  const MainOutlinedButton({
    super.key,
    required this.text,
    required this.icon,
    required this.action,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: !fullWidth
        ? OutlinedButton.styleFrom()
        : OutlinedButton.styleFrom().copyWith(
            minimumSize: const MaterialStatePropertyAll(Size.fromHeight(40)),
          ),
      onPressed: action,
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
