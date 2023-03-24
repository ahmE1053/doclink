import 'package:flutter/material.dart';

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
  });

  final TextEditingController controller;
  final ColorScheme colorScheme;
  final Widget? prefixIcon;
  final Widget? suffix;
  final String? Function(String? value)? validator;
  final void Function(String value)? onChanged;
  final void Function(String value)? onSubmitted;
  final bool obscure;
  final String label;
  final TextInputType inputType;
  final TextInputAction inputAction;

  // final
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onSubmitted,
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      textInputAction: inputAction,
      obscureText: obscure,
      obscuringCharacter: '•',
      keyboardType: inputType,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        suffixIcon: suffix,
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: Colors.white,
        labelText: label,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: colorScheme.primaryContainer,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: colorScheme.error,
            width: 3,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: colorScheme.primaryContainer,
            width: 3,
          ),
        ),
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
