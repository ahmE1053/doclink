import 'package:flutter/material.dart';

import '../../../core/consts/outline_input_border.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller,
    required this.colorScheme,
    this.prefixIcon,
    this.suffix,
    this.validator,
    this.obscure = false,
    required this.label,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.done,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
  });

  final TextEditingController controller;
  final ColorScheme colorScheme;
  final Widget? prefixIcon, suffix;
  final String? Function(String? value)? validator;
  final void Function(String value)? onChanged, onSubmitted;
  final bool obscure, enabled;
  final String label;
  final TextInputType inputType;
  final TextInputAction inputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      onFieldSubmitted: onSubmitted,
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      textInputAction: inputAction,
      obscureText: obscure,
      obscuringCharacter: '•',
      keyboardType: inputType,
      decoration: InputDecoration(
        errorBorder: outlineInputBorder(colorScheme.error),
        enabledBorder: outlineInputBorder(colorScheme.primaryContainer),
        disabledBorder: outlineInputBorder(Colors.grey),
        focusedErrorBorder: outlineInputBorder(colorScheme.error),
        focusedBorder: outlineInputBorder(colorScheme.primaryContainer),
        suffixIcon: suffix,
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: Colors.white,
        labelText: label,
        prefixIconColor: colorScheme.primary,
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
