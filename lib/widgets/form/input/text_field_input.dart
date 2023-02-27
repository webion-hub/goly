import 'package:flutter/material.dart';
import 'package:goly/widgets/form/input/input_label.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final int? maxLines;
  final String? Function(String?)? validation;
  final FocusNode? nextFocus;
  final String? label;

  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.textInputType,
    this.maxLines,
    this.validation,
    this.nextFocus,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? errorMessage;
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: Divider.createBorderSide(context),
    );
    return Column(
      children: [
        label != null ? InputLabel(text: label!) : const SizedBox(),
        const SizedBox(height: 10),
        TextFormField(
          controller: textEditingController,
          maxLines: maxLines ?? 1,
          keyboardType: textInputType,
          obscureText: isPass,
          onFieldSubmitted: (_) =>
              FocusScope.of(context).requestFocus(nextFocus),
          validator: (value) {
            if (validation == null) {
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
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
