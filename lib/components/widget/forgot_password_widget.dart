import 'package:flutter/material.dart';

class ForgotPasswordWidget extends StatelessWidget {
  final VoidCallback onTapLink;

  const ForgotPasswordWidget({super.key, required this.onTapLink});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapLink,
      child: Text(
        'Lupa Password?',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
