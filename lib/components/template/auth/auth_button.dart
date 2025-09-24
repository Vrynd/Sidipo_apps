import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidipo_apps/provider/button_press_provider.dart';

class AuthButton extends StatelessWidget {
  final String titleButton;
  final VoidCallback onTapButton;

  const AuthButton({
    super.key,
    required this.titleButton,
    required this.onTapButton,
  });

  @override
  Widget build(BuildContext context) {
    final isPressed = context.watch<ButtonPressProvider>().isPressed;

    return GestureDetector(
      onTapDown: (_) => context.read<ButtonPressProvider>().press(),
      onTapUp: (_) {
        context.read<ButtonPressProvider>().release();
        onTapButton();
      },
      onTapCancel: () => context.read<ButtonPressProvider>().release(),
      child: AnimatedScale(
        scale: isPressed ? 0.96 : 1.0,
        duration: const Duration(milliseconds: 120),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF2D2DB5), Color(0xFF5757EC), Color(0xFF9B9BFF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              titleButton,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
