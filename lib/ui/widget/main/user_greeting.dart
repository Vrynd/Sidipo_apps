import 'package:flutter/material.dart';

class UserGreeting extends StatelessWidget {
  final ColorScheme color;
  final TextTheme textStyle;
  final String username;
  final VoidCallback? logOutPressed;
  final VoidCallback? syncPressed;

  const UserGreeting({
    super.key,
    required this.username,
    this.logOutPressed,
    this.syncPressed,
    required this.color,
    required this.textStyle,
  });

  /// Fungsi untuk format hari & tanggal dalam bahasa Indonesia
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

    final dayName = days[now.weekday - 1];
    final monthName = months[now.month - 1];

    return "$dayName, ${now.day} $monthName";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            spacing: 2.4,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hi, $username',
                style: textStyle.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: color.onPrimary,
                  fontSize: 24,
                ),
              ),
              Text(
                _formattedDate(),
                style: textStyle.bodyLarge?.copyWith(
                  color: color.surfaceContainerHigh,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton.outlined(
            style: IconButton.styleFrom(
              side: BorderSide(color: color.outlineVariant, width: 1.1),
            ),
            onPressed: syncPressed,
            icon: Icon(Icons.sync_rounded, color: color.onPrimary, size: 20),
          ),
          const SizedBox(width: 6),
          IconButton.outlined(
            style: IconButton.styleFrom(
              side: BorderSide(color: color.outlineVariant, width: 1.1),
            ),
            onPressed: logOutPressed,
            icon: Icon(
              Icons.power_settings_new_rounded,
              color: color.onInverseSurface,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
