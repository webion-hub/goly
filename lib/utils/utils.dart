import 'package:flutter/material.dart';
import 'package:goly/main.dart';

class Utils {
  static final messangerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackbBar(String? text) {
    print(text);
    if (text == null) return;
    final snackBar = SnackBar(content: Text(text));

    messangerKey.currentState!
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
  }
}