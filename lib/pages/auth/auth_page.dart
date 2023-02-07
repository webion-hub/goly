import 'package:flutter/material.dart';
import 'package:goly/components/auth/signup.dart';
import 'package:goly/components/auth/login.dart';
import 'package:goly/image_and_title.dart';
import 'package:goly/utils/constants.dart';

class AuthPage extends StatefulWidget {
  static const routeName = '/auth';
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  void toggle() => setState(() {
        isLogin = !isLogin;
      });

  @override
  Widget build(BuildContext context) {
    final String authType = isLogin ? "Log in" : "Sign up";
    return Scaffold(
      appBar: AppBar(title: Text(authType)),
      body: SingleChildScrollView(
        padding: Constants.pagePadding,
        child: Column(
          children: [
            ImageAndTitle(
              title: authType,
              subtitle: isLogin ? "Welcome back" : "Welcome",
              image: 'assets/images/logo.png',
            ),
            isLogin
                ? LogIn(onClickedSignup: toggle)
                : SignUp(onClickedSignup: toggle),
          ],
        ),
      ),
    );
  }
}
