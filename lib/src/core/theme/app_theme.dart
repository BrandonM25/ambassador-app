import 'package:ambassador_app/src/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const double radiusSm = 14;
  static const double radiusMd = 20;
  static const double radiusLg = 28;
  static const double spaceSm = 8;
  static const double spaceMd = 16;
  static const double spaceLg = 24;

  static ThemeData dark() {
    final scheme = const ColorScheme.dark(
      primary: AppColors.gold,
      secondary: AppColors.softGold,
      surface: AppColors.card,
      onPrimary: AppColors.navy,
      onSecondary: AppColors.navy,
      onSurface: AppColors.ivory,
      onError: Colors.white,
      error: Colors.redAccent,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.navy,
      textTheme: const TextTheme(
        displaySmall: TextStyle(color: AppColors.ivory, fontSize: 34, fontWeight: FontWeight.w700, height: 1.1),
        headlineMedium: TextStyle(color: AppColors.ivory, fontWeight: FontWeight.w700, letterSpacing: 0.2),
        titleLarge: TextStyle(color: AppColors.ivory, fontWeight: FontWeight.w600, fontSize: 22),
        titleMedium: TextStyle(color: AppColors.ivory, fontWeight: FontWeight.w600, fontSize: 16, height: 1.3),
        bodyLarge: TextStyle(color: AppColors.ivory, height: 1.5),
        bodyMedium: TextStyle(color: AppColors.slate, height: 1.45),
      ),
      cardTheme: CardThemeData(
        color: AppColors.card,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusMd)),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.ivory,
        surfaceTintColor: Colors.transparent,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.gold,
          foregroundColor: AppColors.navy,
          minimumSize: const Size.fromHeight(54),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusMd)),
          textStyle: const TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.2),
        ),
      ),
    );
  }
}
