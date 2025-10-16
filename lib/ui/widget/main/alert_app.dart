import 'package:flutter/material.dart';

enum AlertType { info, success, warning, error }

class AlertApp extends StatelessWidget {
  final String message;
  final AlertType type;

  const AlertApp({
    super.key,
    required this.message,
    this.type = AlertType.info,
  });

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color iconColor;
    Color backgroundColor;
    Color borderColor;

    switch (type) {
      case AlertType.success:
        icon = Icons.check_circle_outline_rounded;
        iconColor = Theme.of(context).colorScheme.primary;
        backgroundColor = Theme.of(
          context,
        ).colorScheme.primaryContainer.withValues(alpha: 0.2);
        borderColor = Theme.of(context).colorScheme.primaryContainer;
        break;
      case AlertType.warning:
        icon = Icons.warning_amber_rounded;
        iconColor = Theme.of(context).colorScheme.tertiary;
        backgroundColor = Theme.of(
          context,
        ).colorScheme.tertiaryContainer.withValues(alpha: .25);
        borderColor = Theme.of(context).colorScheme.tertiaryContainer;
        break;
      case AlertType.error:
        icon = Icons.error_outline_rounded;
        iconColor = Theme.of(context).colorScheme.error;
        backgroundColor = Theme.of(
          context,
        ).colorScheme.errorContainer.withValues(alpha: .25);
        borderColor = Theme.of(context).colorScheme.errorContainer;
        break;
      case AlertType.info:
        icon = Icons.info_outline_rounded;
        iconColor = Theme.of(context).colorScheme.primary;
        backgroundColor = Theme.of(context).colorScheme.primaryContainer;
        borderColor = Theme.of(context).colorScheme.primary;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
