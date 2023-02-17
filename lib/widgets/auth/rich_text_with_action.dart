import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextWithAction extends StatelessWidget {
  final String text;
  final String actionText;
  final VoidCallback action;
  const RichTextWithAction(
      {super.key,
      required this.text,
      required this.actionText,
      required this.action});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(color: Theme.of(context).primaryColor),
        children: [
          const WidgetSpan(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = action,
            text: actionText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary,
            ),
          )
        ],
      ),
    );
  }
}
