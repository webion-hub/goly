import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final Function noAction;
  final Function yesAction;
  const ConfirmationDialog({
    required this.title,
    required this.message,
    required this.noAction,
    required this.yesAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('No'),
          onPressed: () => noAction(),
        ),
        ElevatedButton(
          child: const Text('Yes'),
          onPressed: () => yesAction(),
        ),
      ],
    );
  }
}
