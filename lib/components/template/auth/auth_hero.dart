import 'package:flutter/material.dart';

class AuthHero extends StatelessWidget {
  final String title;
  final String subtitle;
  const AuthHero({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.outline,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
