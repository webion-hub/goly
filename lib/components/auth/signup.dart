import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:goly/components/auth/rich_text_with_action.dart';
import 'package:goly/components/fields/email_field.dart';
import 'package:goly/components/fields/password_field.dart';
import 'package:goly/components/dialogs/loading_dialog.dart';
import 'package:goly/components/buttons/main_button.dart';
import 'package:goly/main.dart';
import 'package:goly/pages/auth/handle_profile_page.dart';
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
    if (!isValid) return;

    loadingDialog(context);
    try {
      NavigatorState n = Navigator.of(context);
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      n.pushReplacement(CupertinoPageRoute(
        builder: (context) => HandleProfilePage(
          uid: Utils.currentUid(),
        ),
      ));
    } on FirebaseAuthException catch (e) {
      Utils.showSnackbBar(e.message);
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        MainButton(text: "Sign up", onPressed: signUp),
        const SizedBox(height: 20),
        RichTextWithAction(
            text: 'Already have an account?',
            actionText: 'Log in',
            action: widget.onClickedSignup)
      ],
    );
  }
}
