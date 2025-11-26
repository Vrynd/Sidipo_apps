import 'package:flutter/material.dart';

class AppInfo extends StatelessWidget {
  final ColorScheme color;
  final TextTheme textStyle;
  final String title;
  final String subTitle;

  const AppInfo({
    super.key,
    required this.color,
    required this.textStyle,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 2,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title.toUpperCase(),
            style: textStyle.bodySmall?.copyWith(
              color: color.outlineVariant,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.1,
              fontSize: 12.5,
            ),
          ),
          Text(
            subTitle.toUpperCase(),
            style: textStyle.bodySmall?.copyWith(
              color: color.outlineVariant,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.1,
              fontSize: 12.5,
            ),
          ),
        ],
      ),
    );
  }
}
