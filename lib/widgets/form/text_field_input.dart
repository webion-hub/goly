import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final int? maxLines;
  final String? Function(String?)? validation;
  final FocusNode? nextFocus;

  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.textInputType,
    this.maxLines,
    this.validation,
    this.nextFocus
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? errorMessage;
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: Divider.createBorderSide(context),
    );
    return TextFormField(
      controller: textEditingController,
      maxLines: maxLines ?? 1,
      keyboardType: textInputType,
      obscureText: isPass,
      onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(nextFocus),
      validator: (value) {
          if(validation == null) {
            return null;
          }
          errorMessage = validation!(value);
          if (value != null && errorMessage != null) {
            return errorMessage;
          }
          return null;
        },
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(16),
      ),

    );
  }
}