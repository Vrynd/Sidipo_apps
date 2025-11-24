import 'package:flutter/material.dart';

class Watermark extends StatelessWidget {
  final TextTheme textStyle;
  final String mainTitle;
  final String subTitle;
  final ColorScheme color;

  const Watermark({
    super.key,
    required this.textStyle,
    required this.mainTitle,
    required this.subTitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            mainTitle.toUpperCase(),
            style: textStyle.bodySmall?.copyWith(
              color: color.outline.withValues(alpha: 0.6),
              height: 1.2,
              fontWeight: FontWeight.w500,
            ),

            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4),
          Text(
            subTitle.toUpperCase(),
            style: textStyle.bodySmall?.copyWith(
              color: color.outline.withValues(alpha: 0.6),
              height: 1.2,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
