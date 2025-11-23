import 'package:flutter/material.dart';

class UserGreeting extends StatelessWidget {
  final ColorScheme color;
  final TextTheme textStyle;
  final String username;
  final VoidCallback? onAvatarTap;

  const UserGreeting({
    super.key,
    required this.username,
    this.onAvatarTap,
    required this.color,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            spacing: 2,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hi,',
                style: textStyle.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: color.surfaceContainerHigh,
                ),
              ),
              Text(
                username,
                style: textStyle.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: color.onPrimary,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: onAvatarTap,
            child: CircleAvatar(
              radius: 26,
              backgroundColor: color.surfaceContainerLowest,
              backgroundImage: const NetworkImage(
                'https://www.w3schools.com/w3images/avatar2.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
