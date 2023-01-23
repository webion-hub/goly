import 'package:flutter/material.dart';
import 'package:goly/components/password_form_builder.dart';
import 'package:goly/components/text_form_builder.dart';
import 'package:goly/utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.appName),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
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
              children: const [
                TextFormBuilder(
                  hintText: "Email",
                  textInputAction: TextInputAction.next,
                ),
                 SizedBox(height: 10.0),
                PasswordFormBuilder(
                  suffix: Icons.visibility,
                  hintText: "Password",
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                ),
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
              // highlightElevation: 4.0,
              child: Text(
                'Log in'.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
