import 'package:flutter/material.dart';

class TimelineService extends StatelessWidget {
  final List<TimelineItem> steps;
  final double spacing;

  const TimelineService({super.key, required this.steps, this.spacing = 14});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: steps.map((step) {
        final isLast = steps.indexOf(step) == steps.length - 1;
        return Column(
          children: [
            step,
            if (!isLast) SizedBox(height: spacing),
          ],
        );
      }).toList(),
    );
  }
}

class TimelineItem extends StatelessWidget {
  final ColorScheme color;
  final TextTheme textStyle;
  final String mainTitle;
  final String subTitle;
  final bool isFilled;
  final VoidCallback? onPressed;

  const TimelineItem({
    super.key,
    required this.color,
    required this.textStyle,
    required this.mainTitle,
    required this.subTitle,
    this.isFilled = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: color.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Content
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 8,
              ),
              child: Row(
                spacing: 2,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    spacing: 2,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        subTitle,
                        style: textStyle.bodyMedium?.copyWith(
                          color: color.outline,
                          fontSize: 14.2,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        mainTitle,
                        style: textStyle.titleMedium?.copyWith(
                          color: color.onSurface,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Status
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 6,
                bottom: 16,
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  color: isFilled ? Colors.green.shade50 : Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Status',
                          style: textStyle.bodyMedium?.copyWith(
                            color: color.outline,
                            fontSize: 14.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          isFilled ? 'Sudah Mengisi' : 'Belum Mengisi',
                          style: textStyle.bodyLarge?.copyWith(
                            color: color.onSurfaceVariant.withValues(alpha: .8),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: isFilled ? Colors.green : Colors.orange,
                      child: Icon(
                        isFilled
                            ? Icons.check_circle_rounded
                            : Icons.hourglass_empty_rounded,
                        size: 24,
                        color: color.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
