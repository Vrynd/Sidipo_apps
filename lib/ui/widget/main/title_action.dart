import 'package:flutter/material.dart';

class TitleAction extends StatelessWidget {
  final String mainTitle;
  final ColorScheme color;
  final TextTheme textStyle;
  final VoidCallback? onLogoutPressed;
  final bool showAction;

  const TitleAction({
    super.key,
    required this.mainTitle,
    required this.color,
    required this.textStyle,
    this.onLogoutPressed,
    this.showAction = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          mainTitle,
          style: textStyle.titleMedium?.copyWith(
            color: color.onSurface,
            fontSize: 20.4,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (showAction)
          InkWell(
            onTap: onLogoutPressed,
            child: Icon(
              Icons.power_settings_new_rounded,
              size: 24,
              color: color.error,
            ),
          ),
      ],
    );
  }
}
