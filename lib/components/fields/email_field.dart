import 'package:flutter/material.dart';
import 'package:goly/utils/validators.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;
  const EmailField({super.key, required this.controller});
  
  @override
  Widget build(BuildContext context) {
    String? errorMessage;
    return TextFormField(
        controller: controller,
        decoration: const InputDecoration(labelText: 'E-Mail'),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        validator: (email) {
          errorMessage = Validations.validateEmail(email);
          if (email != null && errorMessage != null) {
            return errorMessage;
          }
          return null;
        });
  }
}
