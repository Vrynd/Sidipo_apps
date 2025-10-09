import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontApps {
  static final TextStyle _headingStyle = GoogleFonts.sora();
  static final TextStyle _bodyStyle = GoogleFonts.cabin();

  /// displayLarge
  static TextStyle displayLarge = _headingStyle.copyWith(
    fontSize: 57,
    fontWeight: FontWeight.w700,
    height: 1.11,
    letterSpacing: -1.5,
  );

  /// displayMedium
  static TextStyle displayMedium = _headingStyle.copyWith(
    fontSize: 45,
    fontWeight: FontWeight.w600,
    height: 1.17,
    letterSpacing: -0.5,
  );

  /// displaySmall
  static TextStyle displaySmall = _headingStyle.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.w500,
    height: 1.25,
    letterSpacing: -0.25,
  );

  /// headlineLarge
  static TextStyle headlineLarge = _headingStyle.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  /// headlineMedium
  static TextStyle headlineMedium = _headingStyle.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    height: 1.25,
  );

  /// headlineSmall
  static TextStyle headlineSmall = _headingStyle.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 1.2,
  );

  /// titleLarge
  static TextStyle titleLarge = _headingStyle.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 1.25,
  );

  /// titleMedium
  static TextStyle titleMedium = _headingStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1.3,
    letterSpacing: 0.15,
  );

  /// titleSmall
  static TextStyle titleSmall = _headingStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.3,
    letterSpacing: 0.1,
  );

  /// bodyLarge
  static TextStyle bodyLarge = _bodyStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.3,
  );

  /// bodyMedium
  static TextStyle bodyMedium = _bodyStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.25,
  );

  /// bodySmall
  static TextStyle bodySmall = _bodyStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0.4,
  );

  /// labelLarge
  static TextStyle labelLarge = _bodyStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 1.25,
  );

  /// labelMedium
  static TextStyle labelMedium = _bodyStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.3,
    letterSpacing: 1.25,
  );

  /// labelSmall
  static TextStyle labelSmall = _bodyStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 1.2,
    letterSpacing: 1.5,
  );
}
