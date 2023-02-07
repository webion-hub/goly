import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? nextFocus;
  const PasswordField({super.key, required this.controller, this.nextFocus});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        decoration: const InputDecoration(labelText: 'Password'),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.visiblePassword,
        onFieldSubmitted: (_) => FocusScope.of(context)
                            .requestFocus(nextFocus),
        obscureText: true,
        validator: (pwd) =>
            pwd != null && pwd.length <= 6 ? 'Enter min. 6 characters' : null);
  }
}
