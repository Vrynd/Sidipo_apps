import 'package:flutter/material.dart';

class HeaderDetail extends StatelessWidget {
  final ColorScheme color;
  final TextTheme textStyle;
  final String mainTitle;
  final String subTitle;
  final bool showActions;
  final VoidCallback? onBack;

  const HeaderDetail({
    super.key,
    required this.color,
    required this.textStyle,
    required this.mainTitle,
    required this.subTitle,
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
              side: BorderSide(color: color.onSecondary, width: 1.1),
            ),
            onPressed:onBack,
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: color.onPrimary,
              size: 20,
            ),
          ),
          Column(
            spacing: 2.4,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                mainTitle,
                style: textStyle.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: color.surfaceContainerHigh,
                ),
              ),
              Text(
                subTitle,
                style: textStyle.titleLarge?.copyWith(
                  color: color.onPrimary,
                  fontSize: 23,
                ),
              ),
            ],
          ),
          if (showActions)
            IconButton.outlined(
              style: IconButton.styleFrom(
                side: BorderSide(color: color.onSecondary, width: 1.1),
              ),
              onPressed: () {},
              icon: Icon(Icons.more_horiz, color: color.onPrimary, size: 20),
            ),
        ],
      ),
    );
  }
}
