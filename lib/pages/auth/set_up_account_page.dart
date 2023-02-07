import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goly/components/buttons/main_button.dart';
import 'package:goly/image_and_title.dart';
import 'package:goly/main.dart';
import 'package:goly/utils/constants.dart';

class SeteUpAccountPage extends StatelessWidget {
  final UserCredential auth;
  final String email;
  const SeteUpAccountPage({super.key, required this.auth, required this.email});

  @override
  Widget build(BuildContext context) {
    var usernameController = TextEditingController(text: '');
    void setUp() {
      FirebaseFirestore.instance.collection('users').doc(auth.user?.uid).set({
        'username': usernameController.text.trim(),
        'email': email,
      });
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    return Scaffold(
      body: Center(
        child: Container(
          padding: Constants.pagePadding,
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageAndTitle(
                  image: 'assets/images/webion-logo.png',
                  title: "Welcome!",
                  subtitle: "Set the user information to get started",
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
