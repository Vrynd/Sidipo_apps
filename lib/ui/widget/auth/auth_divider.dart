import 'package:flutter/material.dart';

class AuthDivider extends StatelessWidget {
  final String labelDivider;
  const AuthDivider({
    super.key,
    required this.labelDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1.2,
            height: 1.7,
            color: Theme.of(
              context,
            ).colorScheme.surfaceContainerHighest,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            labelDivider,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1.2,
            height: 1.7,
            color: Theme.of(
              context,
            ).colorScheme.surfaceContainerHighest,
          ),
        ),
      ],
    );
  }
}

