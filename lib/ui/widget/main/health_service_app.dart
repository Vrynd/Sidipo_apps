import 'package:flutter/material.dart';

class ServiceItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback? onTapService; 

  ServiceItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
    required this.backgroundColor,
    this.onTapService,
  });
}

class HealthServiceApp extends StatelessWidget {
  final List<ServiceItem> items;
  final double spacing;

  const HealthServiceApp({super.key, required this.items, this.spacing = 8});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: List.generate(items.length * 2 - 1, (index) {
          if (index.isEven) {
            final item = items[index ~/ 2];
            return ListTile(
              onTap: item.onTapService,
              dense: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
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
                  child: Icon(item.icon, size: 28, color: item.iconColor),
                ),
              ),
              title: Text(
                item.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                item.subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            );
          } else {
            return Divider(
              height: 0,
              thickness: 1,
              indent: 74,
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
            );
          }
        }),
      ),
    );
  }
}
