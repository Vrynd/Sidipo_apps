import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidipo_apps/provider/redirect_press_provider.dart';


class AuthRedirect extends StatelessWidget {
  final String titleQuestion;
  final String titleAction;
  final void Function()? onTapRedirect;
  final String pressKey; // key unik untuk provider

  const AuthRedirect({
    super.key,
    required this.titleQuestion,
    required this.titleAction,
    required this.onTapRedirect,
    required this.pressKey,
  });

  @override
  Widget build(BuildContext context) {
    final isPressed = context.watch<RedirectPressProvider>().isPressed(pressKey);

    final questionStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
      color: Theme.of(context).colorScheme.outline,
    );
    final actionStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
      color: Theme.of(context).colorScheme.primary,
      fontWeight: isPressed ? FontWeight.w600 : FontWeight.normal,
    );

    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: titleQuestion, style: questionStyle),
            const WidgetSpan(child: SizedBox(width: 6)),
            WidgetSpan(
              child: GestureDetector(
                onTapDown: (_) => context.read<RedirectPressProvider>().press(pressKey),
                onTapUp: (_) {
                  context.read<RedirectPressProvider>().release(pressKey);
                  onTapRedirect?.call();
                },
                onTapCancel: () => context.read<RedirectPressProvider>().release(pressKey),
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 150),
                  style: actionStyle!,
                  child: Text(titleAction),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
