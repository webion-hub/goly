import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;
  const EmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(labelText: 'E-Mail'),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      // validator: (value) {
      //   if (value!.isEmpty || !value.contains('@')) {
      //     return 'Invalid email!';
      //   }
      //   return null;
      // },
    );
  }
}
