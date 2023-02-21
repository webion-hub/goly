import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  final String text;
  const InputLabel({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(text, textAlign: TextAlign.left),
    );
  }
}
