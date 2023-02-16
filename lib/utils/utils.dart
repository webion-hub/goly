import 'dart:html';

import 'package:flutter/material.dart';
import 'package:goly/utils/firebase.dart';

class Utils {
  static final messangerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackbBar(String? text) {
    if (text == null) return;
    final snackBar = SnackBar(content: Text(text));

    messangerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static String currentUid() {
    return firebaseAuth.currentUser!.uid;
  }

  static String currentEmail() {
    return firebaseAuth.currentUser!.email!;
  }

  static Future showCustomDialog({
    required String title,
    required String message,
    required Function noAction,
    required Function yesAction,
    required BuildContext context,
  }) {
    return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text(title),
              content: Text(message
              ),
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
            ));
  }
}
