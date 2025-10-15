import 'package:flutter/material.dart';

class HeaderApp extends StatelessWidget {
  final String? username;
  final String? title;
  final VoidCallback? onAvatarTap;
  final bool showAvatar;

  const HeaderApp({
    super.key,
    this.username,
    this.title,
    this.onAvatarTap,
    this.showAvatar = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (username != null) ...[
              Text(
                'Hi,',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                username!,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ] else if (title != null) ...[
              Text(
                title!,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  // fontSize: 30,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ],
        ),

        if (showAvatar)
          GestureDetector(
            onTap: onAvatarTap,
            child: CircleAvatar(
              radius: 26,
              backgroundColor: Theme.of(
                context,
              ).colorScheme.surfaceContainerLowest,
              backgroundImage: const NetworkImage(
                'https://www.w3schools.com/w3images/avatar2.png',
              ),
            ),
          ),
      ],
    );
  }
}
