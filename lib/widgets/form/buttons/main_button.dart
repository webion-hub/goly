import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final FocusNode? focusNode;
  final VoidCallback onPressed;
  const MainButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.focusNode,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      width: double.infinity,
      child: FilledButton(
        focusNode: focusNode,
        onPressed: onPressed,
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
