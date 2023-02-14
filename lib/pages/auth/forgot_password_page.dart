import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goly/components/buttons/main_button.dart';
import 'package:goly/components/dialogs/loading_dialog.dart';
import 'package:goly/components/fields/email_field.dart';
import 'package:goly/utils/constants.dart';
import 'package:goly/utils/utils.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const routeName = '/forgot-password';
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController(text: '');
  Future resetPassword() async {
    loadingDialog(context);
    try {
      var nav = Navigator.of(context);

      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      Utils.showSnackbBar('Password Reset Email Sent');

      nav.popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackbBar(e.message);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: Center(
        child: SingleChildScrollView(
          padding: Constants.pagePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Rceive an emal to reset your password'),
              const SizedBox(height: 20),
              EmailField(controller: _emailController),
              const SizedBox(height: 30),
              MainButton(
                onPressed: resetPassword,
                text: 'Reset password',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
