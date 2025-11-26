import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/models/service_item.dart';

class HealthService extends StatelessWidget {
  final List<ServiceItem>? items;
  final ColorScheme color;
  final TextTheme textStyle;

  const HealthService({
    super.key,
    this.items,
    required this.color,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final data = items ?? ServiceItem.defaultItems;

    return GridView.builder(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.10,
      ),
      itemBuilder: (context, index) {
        final item = data[index];

        return GestureDetector(
          onTap: item.onTap,
          child: Container(
            decoration: BoxDecoration(
              color: color.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundColor: item.backgroundColor,
                  child: Icon(item.icon, size: 27, color: item.iconColor),
                ),
                const SizedBox(height: 8),
                Text(
                  item.title,
                  textAlign: TextAlign.center,
                  style: textStyle.bodyLarge?.copyWith(
                    color: color.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
