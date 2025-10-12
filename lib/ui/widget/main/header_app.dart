import 'package:flutter/material.dart';

class HeaderApp extends StatelessWidget {
  final String username;
  final VoidCallback? onAvatarTap;

  const HeaderApp({
    super.key,
    required this.username,
    this.onAvatarTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hi,',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            const SizedBox(height: 2),
            Text(
              username,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ],
        ),
        GestureDetector(
          onTap: onAvatarTap,
          child: CircleAvatar(
            radius: 26,
            backgroundColor:
                Theme.of(context).colorScheme.surfaceContainerLowest,
            backgroundImage: const NetworkImage(
              'https://www.w3schools.com/w3images/avatar2.png',
            ),
          ),
        ),
      ],
    );
  }
}
