import 'package:flutter/material.dart';

class BannerApp extends StatelessWidget {
  final String imagePath;
  final double height;

  const BannerApp({
    super.key,
    required this.imagePath,
    this.height = 164,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          width: 1.1,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(imagePath, fit: BoxFit.fill),
      ),
    );
  }
}
