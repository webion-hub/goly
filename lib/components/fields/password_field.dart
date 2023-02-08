import 'package:flutter/material.dart';
import 'package:goly/utils/validators.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? nextFocus;
  const PasswordField({super.key, required this.controller, this.nextFocus});

  @override
  Widget build(BuildContext context) {
    String? errorMessage;
    return TextFormField(
        controller: controller,
        decoration: const InputDecoration(labelText: 'Password'),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.visiblePassword,
        onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(nextFocus),
        obscureText: true,
        validator: (psw) {
          errorMessage = Validations.validatePassword(psw);
          if (psw != null && errorMessage != null) {
            return errorMessage;
          }
          return null;
        });
  }
}
