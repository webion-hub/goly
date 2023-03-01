import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:goly/utils/firebase.dart';
import 'package:image_picker/image_picker.dart';

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

  static pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      return await file.readAsBytes();
    }
  }

  static dateTimeToTimeStamp(dynamic date) {
    return DateTime.parse((date as Timestamp).toDate().toString());
  }
}
