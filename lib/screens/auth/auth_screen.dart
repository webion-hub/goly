import 'package:flutter/material.dart';
import 'package:goly/widgets/auth/rich_text_with_action.dart';
import 'package:goly/widgets/auth/signup.dart';
import 'package:goly/widgets/auth/login.dart';
import 'package:goly/widgets/layout/image_and_title.dart';
import 'package:goly/utils/constants.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  void toggle() => setState(() {
        isLogin = !isLogin;
      });

  @override
  Widget build(BuildContext context) {
    final String authType = isLogin ? "Log in" : "Sign up";
    return Scaffold(
      appBar: AppBar(title: Text(authType)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: Constants.pagePadding,
          child: Column(
            children: [
              ImageAndTitle(
                title: authType,
                subtitle: isLogin ? "Welcome back" : "Welcome",
                image: 'assets/images/logo-icon.png',
              ),
              isLogin
                  ? LogIn(onClickedSignup: toggle)
                  : SignUp(onClickedSignup: toggle),
              const SizedBox(height: 20),
        RichTextWithAction(
            text: isLogin ? 'Don\'t have an account?' : 'Already have an account?',
            actionText: isLogin ? 'Sign up' : 'Log in',
            action: toggle)
            ],
          ),
        ),
      ),
    );
  }
}
