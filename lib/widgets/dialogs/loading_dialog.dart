import 'package:flutter/material.dart';
import 'package:goly/widgets/layout/indicators.dart';

void loadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => buffering()
  );
}
