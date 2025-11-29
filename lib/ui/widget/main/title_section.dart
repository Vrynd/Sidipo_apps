import 'package:flutter/material.dart';

enum TitleActionType { period, toggle, custom }

class TitleSection extends StatefulWidget {
  final String mainTitle;
  final ColorScheme color;
  final TextTheme textStyle;
  final bool showAction;
  final bool? toggleValue;
  final TitleActionType actionType;
  final ValueChanged<DateTime>? onPeriodChange;
  final ValueChanged<bool>? onToggle;

  const TitleSection({
    super.key,
    required this.mainTitle,
    required this.color,
    required this.textStyle,
    this.showAction = true,
    this.actionType = TitleActionType.period,
    this.toggleValue,
    this.onToggle,
    this.onPeriodChange,
  });

  @override
  State<TitleSection> createState() => _TitleSectionState();
}

class _TitleSectionState extends State<TitleSection> {
  DateTime selectedDate = DateTime.now();
  final DateTime now = DateTime.now();

  static const months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "Mei",
    "Jun",
    "Jul",
    "Agu",
    "Sep",
    "Okt",
    "Nov",
    "Des",
  ];

  String get formattedPeriod =>
      "${months[selectedDate.month - 1]} ${selectedDate.year}";

  bool get _canGoNext =>
      !(selectedDate.year == now.year && selectedDate.month == now.month);

  bool get _canGoPrev =>
      !(selectedDate.year == now.year && selectedDate.month == 1);

  void _notifyChange() {
    if (widget.onPeriodChange != null) {
      widget.onPeriodChange!(selectedDate);
    }
  }

  void _nextMonth() {
    if (!_canGoNext) return;

    setState(() {
      final next = DateTime(selectedDate.year, selectedDate.month + 1);

      if (!(next.year > now.year ||
          (next.year == now.year && next.month > now.month))) {
        selectedDate = next;
        _notifyChange();
      }
    });
  }

  void _prevMonth() {
    if (!_canGoPrev) return;

    setState(() {
      final prev = DateTime(selectedDate.year, selectedDate.month - 1);

      if (!(prev.year < now.year - 1)) {
        selectedDate = prev;
        _notifyChange();
      }
    });
  }

  Widget _buildAction() {
    switch (widget.actionType) {
      case TitleActionType.period:
        return _buildPeriodSelector();

      case TitleActionType.toggle:
        return _buildToggleButton();

      case TitleActionType.custom:
        return const SizedBox();
    }
  }

  Widget _buildPeriodSelector() {
    return Row(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _MonthPeriode(
          icon: Icons.chevron_left_rounded,
          enabled: _canGoPrev,
          onTap: _prevMonth,
          color: widget.color,
        ),
        _DisplayPeriode(
          title: formattedPeriod,
          textStyle: widget.textStyle,
          color: widget.color,
        ),
        _MonthPeriode(
          icon: Icons.chevron_right_rounded,
          enabled: _canGoNext,
          onTap: _nextMonth,
          color: widget.color,
        ),
      ],
    );
  }

  Widget _buildToggleButton() {
    final bool value = widget.toggleValue ?? false;

    return GestureDetector(
      onTap: () => widget.onToggle?.call(!value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6.5),
        decoration: BoxDecoration(
          color: widget.color.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: widget.color.outlineVariant.withValues(alpha: 0.4)),
        ),
        child: Icon(
          value ? Icons.expand_less : Icons.expand_more,
          size: 23,
          color: widget.color.outline,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.mainTitle,
          style: widget.textStyle.titleMedium?.copyWith(
            color: widget.color.onSurface,
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
        ),

        if (widget.showAction) _buildAction(),
      ],
    );
  }
}

class _MonthPeriode extends StatelessWidget {
  final IconData icon;
  final bool enabled;
  final VoidCallback? onTap;
  final ColorScheme color;

  const _MonthPeriode({
    required this.icon,
    required this.enabled,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6.5),
        decoration: BoxDecoration(
          color: color.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: color.outlineVariant.withValues(alpha: enabled ? 0.4 : 0.12),
          ),
        ),

        child: Icon(
          icon,
          size: 23,
          color: enabled
              ? color.outline
              : color.outlineVariant.withValues(alpha: (0.3)),
        ),
      ),
    );
  }
}

class _DisplayPeriode extends StatelessWidget {
  final String title;
  final TextTheme textStyle;
  final ColorScheme color;

  const _DisplayPeriode({
    required this.title,
    required this.textStyle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: color.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.outlineVariant.withValues(alpha: 0.4)),
      ),
      child: Text(
        title,
        style: textStyle.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: color.outline,
        ),
      ),
    );
  }
}
