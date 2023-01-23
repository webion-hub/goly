import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goly/components/password_form_builder.dart';
import 'package:goly/components/text_form_builder.dart';
import 'package:goly/utils/constants.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
              'Welcome!',
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const Center(
            child: Text(
              'Create a new account and get started!',
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
                'Sign up'.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {},
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account?'),
              const SizedBox(width: 5.0),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    CupertinoPageRoute(
                      builder: (_) => const RegisterPage(),
                    ),
                  );
                },
                child: Text(
                  'Log in',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}