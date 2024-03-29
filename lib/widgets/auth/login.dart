import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/screens/main/feed/feed_screen.dart';
import 'package:goly/screens/main/profile/handle_profile_screen.dart';
import 'package:goly/services/auth_service.dart';
import 'package:goly/services/user_service.dart';
import 'package:goly/widgets/auth/forgot_password.dart';
import 'package:goly/widgets/form/buttons/main_button.dart';
import 'package:goly/utils/utils.dart';
import 'package:goly/widgets/form/input/text_field_input.dart';
import 'package:goly/widgets/layout/indicators.dart';

class LogIn extends StatefulWidget {
  final VoidCallback onClickedSignup;
  const LogIn({super.key, required this.onClickedSignup});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _emailController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();
  final FocusNode buttonFocusNode = FocusNode();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Future logIn() async {
    final isValid = formKey.currentState?.validate();
    if (isValid == null || !isValid) return;
    setState(() {
      isLoading = true;
    });
    try {
      final router = GoRouter.of(context);
      await AuthService.logInUser(
        email: _emailController.text,
        password: _passwordController.text,
      ).then((value) async {
        final isUserSet = await UserService.isUserSet(uid: FirebaseAuth.instance.currentUser!.uid);
        if(isUserSet) {
          router.go(FeedScreen.routeName);
        } else {
          router.go(HandleProfileScreen.routeNameSetUp);
        }
      });
      
    } on FirebaseAuthException catch (e) {
      Utils.showSnackbBar(e.message);
    } finally {
      setState(() {
        isLoading = false;
      });
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
              TextFieldInput(
                label: "Email",
                hintText: "Email",
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),
              const SizedBox(height: 10.0),
              TextFieldInput(
                label: "Password",
                hintText: "Password",
                isPass: true,
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                onFieldSubmitted: () => logIn(),
              ),
            ],
          ),
        ),
        const ForgotPassword(),
        const SizedBox(height: 20.0),
        isLoading
          ? buffering()
          : MainButton(
              text: "Log in",
              onPressed: logIn,
              focusNode: buttonFocusNode,
            ),
      ],
    );
  }
}
