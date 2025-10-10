import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BottomBarCustom extends StatelessWidget {
  final String text;
  final String actionText;
  final VoidCallback onTap;

  const BottomBarCustom({
    super.key,
    required this.text,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).colorScheme.surface,
      child: Center(
        child: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            children: [
              TextSpan(text: '$text '),
              TextSpan(
                text: actionText,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
                recognizer: TapGestureRecognizer()..onTap = onTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
