import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:goly/components/buttons/main_button.dart';
import 'package:goly/components/pickers/user_image_picker.dart';
import 'package:goly/components/layout/image_and_title.dart';
import 'package:goly/main.dart';
import 'package:goly/utils/constants.dart';

class SeteUpAccountPage extends StatefulWidget {
  final UserCredential auth;

  final String email;

  const SeteUpAccountPage({super.key, required this.auth, required this.email});

  @override
  State<SeteUpAccountPage> createState() => _SeteUpAccountPageState();
}

class _SeteUpAccountPageState extends State<SeteUpAccountPage> {
  File? _userImageFile;
  final formKey = GlobalKey<FormState>();
  void _pickedImage(File image) {
    _userImageFile = image;
    final ref = FirebaseStorage.instance
        .ref()
        .child('user_image')
        .child('${widget.auth.user!.uid}${p.extension(image.path)}');
    ref.putFile(image);
  }

  @override
  Widget build(BuildContext context) {
    var usernameController = TextEditingController(text: '');
    void setUp() {
      final isValid = formKey.currentState!.validate();
      if (!isValid) return;
      if (_userImageFile != null) {}
      FirebaseFirestore.instance
          .collection('users')
          .doc(widget.auth.user?.uid)
          .set({
        'username': usernameController.text.trim(),
        'email': widget.email,
      });
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    return Scaffold(
      body: Center(
        child: Container(
          padding: Constants.pagePadding,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ImageAndTitle(
                  image: 'assets/images/webion-logo.png',
                  title: "Welcome!",
                  subtitle: "Set the user information to get started",
                ),
                UserImagePicker(
                  imagePickFn: _pickedImage,
                ),
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20.0),
                MainButton(text: "Set up", onPressed: setUp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
