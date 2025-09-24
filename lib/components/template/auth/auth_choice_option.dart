import 'package:flutter/material.dart';

class AuthChoiceOption extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTapChoiceOption;
  const AuthChoiceOption({
    super.key,
    required this.iconPath,
    required this.label,
    required this.onTapChoiceOption,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTapChoiceOption,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Theme.of(context).colorScheme.outlineVariant,
              width: 1.4,
            ),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(iconPath, width: 26, height: 26),
                const SizedBox(width: 16),
                Text(
                  label,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
