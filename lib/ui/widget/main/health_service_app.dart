import 'package:flutter/material.dart';

class ServiceItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;
  final Color backgroundColor;

  ServiceItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
    required this.backgroundColor,
  });
}

class HealthServiceApp extends StatelessWidget {
  final List<ServiceItem> items;
  final double spacing;

  const HealthServiceApp({super.key, required this.items, this.spacing = 8});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(items.length * 2 - 1, (index) {
        if (index.isEven) {
          final item = items[index ~/ 2];
          return ListTile(
            dense: true,
            tileColor: Theme.of(context).colorScheme.surfaceContainerLowest,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
            leading: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: item.backgroundColor,
              ),
              child: Center(
                child: Icon(item.icon, size: 30, color: item.iconColor),
              ),
            ),
            title: Text(
              item.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              item.subtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.outline,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        } else {
          return SizedBox(height: spacing);
        }
      }),
    );
  }
}
