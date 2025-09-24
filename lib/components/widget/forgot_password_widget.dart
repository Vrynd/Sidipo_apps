import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidipo_apps/provider/redirect_press_provider.dart';

class ForgotPasswordWidget extends StatelessWidget {
  final VoidCallback onTapLink;
  final String pressKey; // key unik untuk provider

  const ForgotPasswordWidget({
    super.key,
    required this.onTapLink,
    required this.pressKey,
  });

  @override
  Widget build(BuildContext context) {
    final isPressed = context.watch<RedirectPressProvider>().isPressed(pressKey);
    final style = Theme.of(context).textTheme.titleMedium?.copyWith(
      color: Theme.of(context).colorScheme.primary,
      fontWeight: isPressed ? FontWeight.w600 : FontWeight.normal,
    );

    return GestureDetector(
      onTapDown: (_) => context.read<RedirectPressProvider>().press(pressKey),
      onTapUp: (_) {
        context.read<RedirectPressProvider>().release(pressKey);
        onTapLink();
      },
      onTapCancel: () => context.read<RedirectPressProvider>().release(pressKey),
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 150),
        style: style!,
        child: Text(
          'Lupa Password?',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
