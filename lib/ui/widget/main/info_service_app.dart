import 'package:flutter/material.dart';

class InfoItem {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String value;

  InfoItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
  });
}

class SummaryItem {
  final String title;
  final String number;
  final String unit;

  SummaryItem({required this.title, required this.number, required this.unit});
}

class InfoServiceApp extends StatelessWidget {
  final List<InfoItem> info;
  final List<SummaryItem> summary;
  final double spacing;

  const InfoServiceApp({
    super.key,
    required this.info,
    required this.summary,
    this.spacing = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: List.generate(info.length * 2 - 1, (index) {
              if (index.isEven) {
                final item = info[index ~/ 2];
                return ListTile(
                  dense: true,
                  leading: Icon(item.icon, size: 24, color: item.iconColor),
                  title: Text(
                    item.title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  trailing: Text(
                    item.value,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                );
              } else {
                // Divider antar item
                return Divider(
                  height: 0,
                  thickness: 1.1,
                  indent: 56,
                  color: Theme.of(context).colorScheme.surfaceContainerHigh,
                );
              }
            }),
          ),
        ),

        SizedBox(height: spacing),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(summary.length * 2 - 1, (index) {
            if (index.isEven) {
              final summaryStats = summary[index ~/ 2];
              return Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        summaryStats.title,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: summaryStats.number,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            TextSpan(
                              text: ' ${summaryStats.unit}',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.outline,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const SizedBox(width: 14);
            }
          }),
        ),
      ],
    );
  }
}
