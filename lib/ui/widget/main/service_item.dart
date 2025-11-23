import 'package:flutter/material.dart';

class ServiceItem {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Color iconColor;
  final Color backgroundColor;

  ServiceItem({
    required this.title,
    required this.icon,
    required this.onTap,
    required this.iconColor,
    required this.backgroundColor,
  });

  // Daftar menu default
  static List<ServiceItem> defaultItems() => [
    ServiceItem(
      title: 'Ibu Hamil',
      icon: Icons.pregnant_woman,
      iconColor: Colors.pink,
      backgroundColor: Colors.pink.shade100,
      onTap: () {},
    ),
    ServiceItem(
      title: 'Balita',
      icon: Icons.child_care,
      iconColor: Colors.blue,
      backgroundColor: Colors.blue.shade100,
      onTap: () {},
    ),
    ServiceItem(
      title: 'Remaja',
      icon: Icons.school,
      iconColor: Colors.orange,
      backgroundColor: Colors.orange.shade100,
      onTap: () {},
    ),
    ServiceItem(
      title: 'Dewasa',
      icon: Icons.work,
      iconColor: Colors.green,
      backgroundColor: Colors.green.shade100,
      onTap: () {},
    ),
    ServiceItem(
      title: 'Lansia',
      icon: Icons.elderly,
      iconColor: Colors.purple,
      backgroundColor: Colors.purple.shade100,
      onTap: () {},
    ),
    ServiceItem(
      title: 'Lainnya',
      icon: Icons.more_horiz,
      iconColor: Colors.grey,
      backgroundColor: Colors.grey.shade300,
      onTap: () {},
    ),
  ];
}
