import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidipo_apps/provider/show_password_provider.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword; // pakai ini
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.label,
    this.isPassword = false, // default false
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  OutlineInputBorder inputBorder(BuildContext context, Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: color, width: 1.4),
    );
  }

  @override
  Widget build(BuildContext context) {
    final showPassword = isPassword
        ? context.watch<ShowHidePasswordProvider>().showHide
        : false;

    return TextFormField(
      controller: controller,
      obscureText: isPassword ? showPassword : false,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.done,
      validator: validator,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      cursorColor: Theme.of(context).colorScheme.secondary,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: isPassword
            ? GestureDetector(
                onTap: () {
                  context.read<ShowHidePasswordProvider>().showHide =
                      !showPassword;
                },
                child: Icon(
                  showPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 24,
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
              )
            : null,
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
        errorBorder: inputBorder(context, Theme.of(context).colorScheme.error),
        focusedErrorBorder: inputBorder(
          context,
          Theme.of(context).colorScheme.error,
        ),
      ),
    );
  }
}
