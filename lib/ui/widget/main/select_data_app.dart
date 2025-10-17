import 'package:flutter/material.dart';

class SelectDataApp extends StatelessWidget {
  final String title;
  final bool isRequired;
  final IconData? infoIcon;
  final List<String> options;
  final List<String> selectedValues;
  final ValueChanged<List<String>> onChanged;
  final EdgeInsetsGeometry margin;

  const SelectDataApp({
    super.key,
    required this.title,
    this.isRequired = false,
    required this.options,
    required this.selectedValues,
    required this.onChanged,
    this.infoIcon = Icons.info_outline,
    this.margin = const EdgeInsets.only(bottom: 16),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text.rich(
            TextSpan(
              text: title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(height: 1.3),
              children: isRequired
                  ? [
                      TextSpan(
                        text: ' *',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.error,
                            ),
                      ),
                    ]
                  : [],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).colorScheme.surfaceContainerHigh,
                width: 1.3,
              ),
            ),
            child: Column(
              children: [
                for (int i = 0; i < options.length; i++) ...[
                  CheckboxListTile(
                    value: selectedValues.contains(options[i]),
                    onChanged: (bool? value) {
                      final updatedValues = List<String>.from(selectedValues);
                      if (value == true) {
                        updatedValues.add(options[i]);
                      } else {
                        updatedValues.remove(options[i]);
                      }
                      onChanged(updatedValues);
                    },
                    dense: true,
                    visualDensity: const VisualDensity(horizontal: -4),
                    contentPadding: EdgeInsets.zero,
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outlineVariant,
                      width: 1.6,
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      options[i],
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  ),
                  if (i != options.length - 1)
                    Divider(
                      height: 0,
                      thickness: 1.4,
                      color: Theme.of(context).colorScheme.surfaceContainerHigh,
                    ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
