import 'package:flutter/material.dart';

class HealthServiceItem {
  final List<Color> gradient;
  final String title;
  final String subtitle;

  HealthServiceItem({
    required this.gradient,
    required this.title,
    required this.subtitle,
  });

  // Contoh data default
  static List<HealthServiceItem> defaultItems = [
    HealthServiceItem(
      gradient: [Color(0xFFEEDAFF), Color(0xFFFFCDE7)],
      title: "Ibu Hamil & Nifas",
      subtitle: "Pemeriksaan kehamilan & konseling",
    ),
    HealthServiceItem(
      gradient: [Color(0xFFFFF7E7), Color(0xFFB8E2FF)],
      title: "Bayi atau Balita",
      subtitle: "Imunisasi Dasar Lengkap",
    ),
    HealthServiceItem(
      gradient: [Color(0xFFFFE4C7), Color(0xFFC7E3FF)],
      title: "Usia Remaja",
      subtitle: "Skrining status gizi, tinggi & berat badan",
    ),
    HealthServiceItem(
      gradient: [Color(0xFFE4F1F4), Color(0xFFA8E4D7)],
      title: "Usia Dewasa",
      subtitle: "Skrining penyakit tidak menular",
    ),
    HealthServiceItem(
      gradient: [Color(0xFFDDEEC9), Color(0xFFA6D9A8)],
      title: "Usia Lansia",
      subtitle: "Pemeriksaan rutin tekanan darah",
    ),
  ];
}