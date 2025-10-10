import 'package:flutter/material.dart';

class AuthOption extends StatelessWidget {
  final List<ChoiceOption> options;

  const AuthOption({
    super.key,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < options.length; i++) ...[
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  width: 1.2,
                ),
                minimumSize: const Size(double.infinity, 55),
                backgroundColor:
                    Theme.of(context).colorScheme.surfaceContainerLow,
                elevation: 0,
              ),
              onPressed: options[i].onPressed,
              child: Image.asset(
                options[i].iconPath,
                height: 28,
              ),
            ),
          ),
          if (i != options.length - 1) const SizedBox(width: 12),
        ],
      ],
    );
  }
}

class ChoiceOption {
  final String iconPath;
  final VoidCallback onPressed;

  ChoiceOption({
    required this.iconPath,
    required this.onPressed,
  });
}
