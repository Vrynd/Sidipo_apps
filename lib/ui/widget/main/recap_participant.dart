import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/models/recap_participant_item.dart';

// Widget utama untuk menampilkan rekap data peserta posyandu
class RecapParticipant extends StatefulWidget {
  final List<Map<String, dynamic>> itemsData;
  final ColorScheme color;
  final TextTheme textStyle;

  const RecapParticipant({
    super.key,
    required this.itemsData,
    required this.color,
    required this.textStyle,
  });

  @override
  State<RecapParticipant> createState() => _RecapParticipantState();
}

class _RecapParticipantState extends State<RecapParticipant> {
  // Variabel untuk menentukan apakah item ditampilkan secara lengkap
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // Mengkonversi List<Map ke model RecapParticipantItem
    List<RecapParticipantItem> items = widget.itemsData
        .map((e) => RecapParticipantItem.fromMap(e))
        .toList();

    // Menentukan item yang ditampilkan berdasarkan status isExpanded
    List<RecapParticipantItem> displayItems = isExpanded
        ? items
        : items.length > 4
        ? items.sublist(0, 4)
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
          // List data hasil dari mapping
          ...List.generate(displayItems.length, (index) {
            final item = displayItems[index];

            // Variable untuk menentukan ikon dan warna trend
            IconData trendIcon = Icons.trending_flat_rounded;
            Color trendColor = Colors.grey.shade500;

            // Menentukan ikon dan warna sesuai dengan trend
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

            // Widget item list berisi title, percentage, trend, dan total count
            return Column(
              children: [
                ListTile(
                  dense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
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
                      color: widget.color.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: widget.color.surfaceContainerHigh.withValues(
                          alpha: .5,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.people_outline_rounded, size: 20, color: widget.color.secondary,),
                        const SizedBox(width: 6),
                        Text(
                          '${item.count}',
                          style: widget.textStyle.bodyLarge?.copyWith(
                            color: widget.color.outline,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Menampilkan divider jika bukan item terakhir
                if (index != displayItems.length - 1)
                  RecapDivider(color: widget.color.outlineVariant, indent: 16),
              ],
            );
          }),

          // Tombol expand/collapse jika jumlah item lebih dari 4
          if (items.length > 4)
            _RecapFooter(
              isExpanded: isExpanded,
              onTap: () => setState(() => isExpanded = !isExpanded),
              color: widget.color,
              textStyle: widget.textStyle,
            ),
        ],
      ),
    );
  }
}


// Widget untuk menampilkan divider sebagi garis pembatas
class RecapDivider extends StatelessWidget {
  final Color color;
  final double indent;
  final double endIndent;

  const RecapDivider({
    super.key,
    required this.color,
    this.indent = 0,
    this.endIndent = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0,
      thickness: 0.8,
      indent: indent,
      endIndent: endIndent,
      color: color.withValues(alpha: .4),
    );
  }
}

// Widget untuk memperluas atau menutup daftar item
class _RecapFooter extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onTap;
  final ColorScheme color;
  final TextTheme textStyle;

  const _RecapFooter({
    required this.isExpanded,
    required this.onTap,
    required this.color,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RecapDivider(color: color.outlineVariant),
        ListTile(
          dense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 2,
          ),
          title: Center(
            child: Text(
              isExpanded ? "Tutup" : "Lihat Selengkapnya",
              style: textStyle.bodyMedium?.copyWith(
                color: color.primary,
                fontSize: 15.2,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}
