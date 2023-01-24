import 'package:flutter/material.dart';
import 'package:goly/components/auth/signup.dart';
import 'package:goly/components/auth/login.dart';

class AuthPage extends StatefulWidget {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(isLogin ? "Login" : "Signup")
      ),
      body: isLogin
        ? LogIn(onClickedSignup: toggle)
        : SignUp(onClickedSignup: toggle),
    );
  }
}
