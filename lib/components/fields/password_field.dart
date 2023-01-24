import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  const PasswordField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        decoration: const InputDecoration(labelText: 'Password'),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        validator: (pwd) =>
            pwd != null && pwd.length <= 6 ? 'Enter min. 6 characters' : null);
  }
}
