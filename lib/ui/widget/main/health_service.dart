import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/models/service_item.dart'; // impor model

class HealthService extends StatelessWidget {
  final HealthServiceItem item;
  final VoidCallback? onTap;

  const HealthService({super.key, required this.item, this.onTap});

  Color getAutoTextColor(List<Color> gradient) {
    int r =
        (((gradient[0].r * 255.0).round() & 0xff) +
            ((gradient[1].r * 255.0).round() & 0xff)) ~/
        2;
    int g =
        (((gradient[0].g * 255.0).round() & 0xff) +
            ((gradient[1].g * 255.0).round() & 0xff)) ~/
        2;
    int b =
        (((gradient[0].b * 255.0).round() & 0xff) +
            ((gradient[1].b * 255.0).round() & 0xff)) ~/
        2;
    double luminance = (0.299 * r + 0.587 * g + 0.114 * b) / 255;
    if (luminance > 0.7) {
      return const Color(0xFF374B61);
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final textColor = getAutoTextColor(item.gradient);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: item.gradient,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .06),
              blurRadius: 18,
              offset: const Offset(0, 6),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: .03),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 4,
                    height: 40,
                    decoration: BoxDecoration(
                      color: textColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.subtitle,
                        style: TextStyle(
                          color: textColor.withValues(alpha: .8),
                          fontSize: 15.2,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(color: textColor.withValues(alpha: 0.2), thickness: 1.1),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
                bottom: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Lihat Layanan',
                    style: TextStyle(
                      color: textColor.withValues(alpha: 0.6),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                    color: textColor.withValues(alpha: 0.7),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StackedServiceCards extends StatefulWidget {
  final List<HealthServiceItem> services;
  final void Function(HealthServiceItem service)? onCardTap;
  final bool isClosed; // toggle offset

  const StackedServiceCards({
    super.key,
    required this.services,
    this.onCardTap,
    required this.isClosed,
  });

  @override
  State<StackedServiceCards> createState() => _StackedServiceCardsState();
}

class _StackedServiceCardsState extends State<StackedServiceCards> {
  @override
  Widget build(BuildContext context) {
    final listToRender = widget.isClosed
        ? widget.services.reversed
              .toList()
        : widget.services;
    return SizedBox(
      height: 360,
      child: Stack(
        clipBehavior: Clip.none,
        children: List.generate(widget.services.length, (i) {
          final item = listToRender[i];

          double offset = widget.isClosed ? i * 20.0 : i * 70.0;

          return AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: offset,
            left: 0,
            right: 0,
            child: HealthService(
              item: item,
              onTap: () => widget.onCardTap?.call(item),
            ),
          );
        }),
      ),
    );
  }
}
