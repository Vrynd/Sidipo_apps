import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final ColorScheme color;
  final TextTheme textStyle;
  final String imagePath;
  final String mainTitle;
  final String description;

  const EmptyState({
    super.key,
    required this.color,
    required this.textStyle,
    required this.imagePath,
    required this.mainTitle,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 200,
            width: 200,
          ),
          const SizedBox(height: 10),
          Text(
            mainTitle,
            style: textStyle.titleMedium?.copyWith(
              color: color.outline,
              fontSize: 20.4,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            textAlign: TextAlign.center,
            style: textStyle.bodyLarge?.copyWith(
              color: color.outline.withValues(alpha: 0.8),
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}