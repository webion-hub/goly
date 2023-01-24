import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:goly/components/fields/email_field.dart';
import 'package:goly/components/fields/password_field.dart';
import 'package:goly/components/dialogs/loading_dialog.dart';
import 'package:goly/main.dart';
import 'package:goly/utils/constants.dart';
import 'package:goly/utils/utils.dart';

class SignUp extends StatefulWidget {
  final VoidCallback onClickedSignup;
  const SignUp({super.key, required this.onClickedSignup});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

    Future signUp() async {
      final isValid = formKey.currentState!.validate();
      if(!isValid) return;

      loadingDialog(context);
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } on FirebaseAuthException catch (e) {
        Utils.showSnackbBar(e.message);
      }
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }



  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(
      padding: Constants.pagePadding,
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
              'Welcome!',
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const Center(
            child: Text(
              'Sign up and get started!',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(height: 25.0),
          Form(
            key: formKey,
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
              onPressed: signUp,
              child: Text(
                'Sign up'.toUpperCase(),
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
              text: 'Already have an account?',
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
                  text: 'Log in',
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
