import 'package:flutter/material.dart';

class HeaderDetail extends StatelessWidget {
  final ColorScheme color;
  final TextTheme textStyle;
  final String mainTitle;
  final bool showActions;
  final VoidCallback? onBack;

  const HeaderDetail({
    super.key,
    required this.color,
    required this.textStyle,
    required this.mainTitle,
    this.showActions = true,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton.outlined(
            style: IconButton.styleFrom(
              side: BorderSide(color: color.outlineVariant, width: 1.1),
            ),
            onPressed: onBack,
            icon: Icon(Icons.arrow_back, color: color.onPrimary, size: 22),
          ),
          Text(
            mainTitle,
            style: textStyle.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: color.onPrimary,
              fontSize: 23,
            ),
          ),
          if (showActions)
            IconButton.outlined(
              style: IconButton.styleFrom(
                side: BorderSide(color: color.outlineVariant, width: 1.1),
              ),
              onPressed: () {},
              icon: Icon(Icons.more_horiz, color: color.onPrimary, size: 20),
            ),
        ],
      ),
    );
  }
}
