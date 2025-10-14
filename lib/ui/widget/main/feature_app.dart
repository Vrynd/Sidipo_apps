import 'package:flutter/material.dart';

class FeatureItem {
  final IconData icon;
  final String title;
  final Color? iconColor;
  final Color? backgroundColor;

  FeatureItem({
    required this.icon,
    required this.title,
    this.iconColor,
    this.backgroundColor,
  });
}

class FeatureApp extends StatelessWidget {
  final List<FeatureItem> items;
  final double spacing;

  const FeatureApp({super.key, required this.items, this.spacing = 12});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(items.length * 2 - 1, (index) {
        if (index.isEven) {
          final item = items[index ~/ 2];
          return Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundColor:
                          item.backgroundColor ??
                          Theme.of(context).colorScheme.secondaryContainer,
                      child: Icon(
                        item.icon,
                        size: 26,
                        color:
                            item.iconColor ??
                            Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.title,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return SizedBox(width: spacing);
        }
      }),
    );
  }
}
