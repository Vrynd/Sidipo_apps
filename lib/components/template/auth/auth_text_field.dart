import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.label,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
  });

  OutlineInputBorder inputBorder(BuildContext context, Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: color, width: 1.4),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.done,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
      cursorColor: Theme.of(context).colorScheme.secondary,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon,
        labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.outline,
            ),
        enabledBorder: inputBorder(
          context,
          Theme.of(context).colorScheme.outlineVariant,
        ),
        focusedBorder: inputBorder(
          context,
          Theme.of(context).colorScheme.primary,
        ),
        errorBorder: inputBorder(
          context,
          Theme.of(context).colorScheme.error,
        ),
        focusedErrorBorder: inputBorder(
          context,
          Theme.of(context).colorScheme.error,
        ),
      ),
    );
  }
}
