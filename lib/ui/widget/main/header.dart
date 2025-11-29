import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final ColorScheme color;
  final TextTheme textStyle;
  final String mainTitle;
  final String? subTitle;
  final bool showActions;
  final bool useGreeting;
  final VoidCallback? onLogout;
  final VoidCallback? onSync;

  const Header({
    super.key,
    required this.color,
    required this.textStyle,
    required this.mainTitle,
    this.subTitle,
    this.showActions = true,
    this.useGreeting = true,
    this.onLogout,
    this.onSync,
  });

  /// Format tanggal Indonesia
  String _formattedDate() {
    final now = DateTime.now();

    const days = [
      "Senin",
      "Selasa",
      "Rabu",
      "Kamis",
      "Jumat",
      "Sabtu",
      "Minggu",
    ];

    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "Mei",
      "Jun",
      "Jul",
      "Agu",
      "Sep",
      "Okt",
      "Nov",
      "Des",
    ];

    return "${days[now.weekday - 1]}, ${now.day} ${months[now.month - 1]}";
  }

  @override
  Widget build(BuildContext context) {
    final displayTitle = useGreeting ? "Hi, $mainTitle" : mainTitle;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            spacing: 2.4,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                displayTitle,
                style: textStyle.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: color.onPrimary,
                  fontSize: 25,
                ),
              ),
              Text(
                subTitle ?? _formattedDate(),
                style: textStyle.bodyLarge?.copyWith(
                  color: color.surfaceContainerHigh,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const Spacer(),
          if (showActions) ...[
            IconButton.outlined(
              style: IconButton.styleFrom(
                side: BorderSide(color: color.onSecondary, width: 1.1),
              ),
              onPressed: onSync,
              icon: Icon(Icons.sync_rounded, color: color.onPrimary, size: 20),
            ),
            const SizedBox(width: 6),
            IconButton.outlined(
              style: IconButton.styleFrom(
                side: BorderSide(color: color.onSecondary, width: 1.1),
              ),
              onPressed: onLogout,
              icon: Icon(
                Icons.power_settings_new_rounded,
                color: color.onInverseSurface,
                size: 20,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
