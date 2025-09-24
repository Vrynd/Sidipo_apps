import 'package:flutter/material.dart';

class DividerOptionWidget extends StatelessWidget {
  const DividerOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: Theme.of(context).colorScheme.outlineVariant,
            thickness: 1.1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Atau masuk dengan',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Theme.of(context).colorScheme.outlineVariant,
            thickness: 1.1,
          ),
        ),
      ],
    );
  }
}
