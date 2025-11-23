import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/models/health_stat_item.dart';

class HealthStatCard extends StatefulWidget {
  final List<Map<String, dynamic>> itemsData;
  final ColorScheme color;
  final TextTheme textStyle;

  const HealthStatCard({
    super.key,
    required this.itemsData,
    required this.color,
    required this.textStyle,
  });

  @override
  State<HealthStatCard> createState() => _HealthStatCardState();
}

class _HealthStatCardState extends State<HealthStatCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // Konversi Map ke HealthStatItem
    List<HealthStatItem> items =
        widget.itemsData.map((e) => HealthStatItem.fromMap(e)).toList();

    // Tentukan item yang ditampilkan
    List<HealthStatItem> displayItems = isExpanded
        ? items
        : items.length > 3
            ? items.sublist(0, 3)
            : items;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.color.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...List.generate(displayItems.length, (index) {
            final item = displayItems[index];

            IconData trendIcon;
            Color trendColor;

            switch (item.trend) {
              case TrendType.up:
                trendIcon = Icons.trending_up_rounded;
                trendColor = Colors.green.shade500;
                break;
              case TrendType.down:
                trendIcon = Icons.trending_down_rounded;
                trendColor = Colors.red.shade500;
                break;
              case TrendType.flat:
                trendIcon = Icons.trending_flat_rounded;
                trendColor = Colors.grey.shade500;
                break;
            }

            return Column(
              children: [
                ListTile(
                  dense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  title: Text(
                    item.title,
                    style: widget.textStyle.titleSmall?.copyWith(
                      fontSize: 17.6,
                      color: widget.color.onSurfaceVariant,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(trendIcon, color: trendColor, size: 16.6),
                      const SizedBox(width: 6),
                      Text(
                        '${item.percentage}%',
                        style: widget.textStyle.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.4,
                          color: widget.color.outline.withValues(alpha: .6),
                        ),
                      ),
                    ],
                  ),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.5,
                      horizontal: 10.5,
                    ),
                    decoration: BoxDecoration(
                      color: widget.color.surfaceContainerHigh.withValues(alpha: .4),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: widget.color.surfaceContainerHigh.withValues(alpha: .5),
                      ),
                    ),
                    child: Text(
                      '${item.count}',
                      style: widget.textStyle.bodyLarge?.copyWith(
                        color: widget.color.outline,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                if (index != displayItems.length - 1)
                  Divider(
                    height: 0,
                    thickness: 0.8,
                    indent: 16,
                    color: widget.color.outlineVariant.withValues(alpha: .4),
                  ),
              ],
            );
          }),

          // Tombol "Lihat Selengkapnya" sebagai ListTile
          if (items.length > 3)
            Column(
              children: [
                Divider(
                  height: 0,
                  thickness: 0.8,
                  color: widget.color.outlineVariant.withValues(alpha: .4),
                ),
                ListTile(
                  dense: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                  title: Center(
                    child: Text(
                      isExpanded ? 'Tutup' : 'Lihat Selengkapnya',
                      style: widget.textStyle.bodyMedium?.copyWith(
                        color: widget.color.primary,
                        fontSize: 15.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                ),
              ],
            ),
        ],
      ),
    );
  }
}
