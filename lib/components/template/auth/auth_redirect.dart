import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthRedirect extends StatelessWidget {
  final String titleQuestion;
  final String titleAction;
  final void Function()? onTapRedirect;
  const AuthRedirect({
    super.key,
    required this.titleQuestion,
    required this.titleAction,
    required this.onTapRedirect,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: titleQuestion,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
            const WidgetSpan(child: SizedBox(width: 6)),
            TextSpan(
              text: titleAction,
              style: Theme.of(context).textTheme.titleMedium
                  ?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
              recognizer: TapGestureRecognizer()..onTap = onTapRedirect,
            ),
          ],
        ),
      ),
    );
  }
}
