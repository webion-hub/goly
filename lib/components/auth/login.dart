import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:goly/components/fields/email_field.dart';
import 'package:goly/components/fields/password_field.dart';
import 'package:goly/main.dart';

class LogIn extends StatefulWidget {
  final VoidCallback onClickedSignup;
  const LogIn({super.key, required this.onClickedSignup});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _emailController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future logIn() async {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
      } on FirebaseAuthException catch (e) {
        print(e);
      }
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 10),
          SizedBox(
            height: 170.0,
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/images/logo.png'),
          ),
          const SizedBox(height: 20.0),
          const Center(
            child: Text(
              'Welcome back!',
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const Center(
            child: Text(
              'Log into your account and get started!',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(height: 25.0),
          Form(
            child: Column(
              children: [
                EmailField(
                  controller: _emailController,
                ),
                const SizedBox(height: 10.0),
                PasswordField(controller: _passwordController)
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            height: 45.0,
            width: 180.0,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).colorScheme.primary,
                ),
              ),
              onPressed: logIn,
              child: Text(
                'Log in'.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          RichText(
            text: TextSpan(
              text: 'Don\'t have an account?',
               style: TextStyle(color: Theme.of(context).primaryColor),
              children: [
                const WidgetSpan(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                  ),
                ),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = widget.onClickedSignup,
                  text: 'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}