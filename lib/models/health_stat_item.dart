enum TrendType { up, down, flat }

class HealthStatItem {
  final String title;
  final double percentage;
  final int count;
  final TrendType trend;

  HealthStatItem({
    required this.title,
    required this.percentage,
    required this.count,
    required this.trend,
  });

  /// Factory untuk konversi dari Map
  factory HealthStatItem.fromMap(Map<String, dynamic> map) {
    TrendType trend;
    switch (map['trend']) {
      case 'up':
        trend = TrendType.up;
        break;
      case 'down':
        trend = TrendType.down;
        break;
      default:
        trend = TrendType.flat;
    }

    return HealthStatItem(
      title: map['title'] ?? '',
      percentage: (map['percentage'] ?? 0).toDouble(),
      count: map['count'] ?? 0,
      trend: trend,
    );
  }
}
