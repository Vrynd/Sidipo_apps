import 'package:flutter/material.dart';

class AuthPassword extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final List<String>? autofillHints;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onForgotPassword;

  const AuthPassword({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.autofillHints,
    this.focusNode,
    this.onChanged,
    this.onForgotPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                label,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontSize: 18),
              ),
            ),
            if (onForgotPassword != null)
              GestureDetector(
                onTap: onForgotPassword,
                child: Text(
                  'Lupa Password?',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          style: Theme.of(context).textTheme.titleMedium,
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          autofillHints: autofillHints,
          focusNode: focusNode,
          onChanged: onChanged,
          autocorrect: false,
          enableSuggestions: false,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.surfaceContainerLow,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                width: 1.2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 1.5,
              ),
            ),
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 17,
              color: Theme.of(context).colorScheme.outline,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 16,
            ),
          ),
        ),
      ],
    );
  }
}
