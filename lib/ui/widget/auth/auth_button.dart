import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String textAction;
  final bool isLoading;

  const AuthButton({
    super.key,
    required this.onPressed,
    required this.textAction,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [Color(0xFF1C6585), Color(0xFF62B6CB)],
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 26,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Theme.of(context).colorScheme.surface,
                ),
              )
            : Text(
                textAction,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
      ),
    );
  }
}
