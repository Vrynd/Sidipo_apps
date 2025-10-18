import 'package:flutter/material.dart';

class InputDataApp extends StatelessWidget {
  final String title;
  final String hintText;
  final bool isRequired;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final int minLines;
  final int maxLines;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry margin;

  const InputDataApp({
    super.key,
    required this.title,
    required this.hintText,
    this.isRequired = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.onChanged,
    this.controller,
    this.minLines = 1,
    this.maxLines = 1,
    this.onTap,
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
      child: Padding(
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
            TextField(
              controller: controller,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              minLines: minLines,
              maxLines: maxLines,
              readOnly: onTap != null,
              onTap: onTap,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).colorScheme.surfaceContainerLow,
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                  fontWeight: FontWeight.w500,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.surfaceContainerHigh,
                    width: 1.3,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.surfaceContainerHigh,
                    width: 1.3,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    width: 1.3,
                  ),
                ),
              ),
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
