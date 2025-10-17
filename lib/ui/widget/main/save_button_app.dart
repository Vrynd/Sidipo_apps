import 'package:flutter/material.dart';

class SaveButtonApp extends StatelessWidget {
  final String titleAction;
  final VoidCallback onSave;
  final VoidCallback onReset;
  final bool showResetButton;
  final IconData iconReset;
  final double height;
  final EdgeInsetsGeometry padding;

  const SaveButtonApp({
    super.key,
    required this.titleAction,
    required this.onSave,
    required this.onReset,
    this.showResetButton = true,
    this.iconReset = Icons.restart_alt_rounded,
    this.height = 50,
    this.padding = const EdgeInsets.symmetric(horizontal: 22, vertical: 14), required bool isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).colorScheme.surfaceContainerLowest,
      elevation: 0,
      padding: padding,
      child: Row(
        children: [
          Expanded(
            flex: showResetButton ? 3 : 1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: Size(double.infinity, height),
                backgroundColor: Theme.of(context).colorScheme.primary,
                elevation: 0,
              ),
              onPressed: onSave,
              child: Text(
                titleAction,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),

          if (showResetButton) ...[
            const SizedBox(width: 12),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: Size(double.infinity, height),
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.surfaceContainerHigh,
                  elevation: 0,
                ),
                onPressed: onReset,
                child: Icon(
                  iconReset,
                  size: 28,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
