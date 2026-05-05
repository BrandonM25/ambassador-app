import 'package:ambassador_app/src/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData dark() {
    final scheme = const ColorScheme.dark(
      primary: AppColors.gold,
      secondary: AppColors.gold,
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
        headlineMedium: TextStyle(
          color: AppColors.ivory,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
        ),
        titleLarge: TextStyle(color: AppColors.ivory, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(color: AppColors.ivory),
        bodyMedium: TextStyle(color: AppColors.slate),
      ),
      cardTheme: CardThemeData(
        color: AppColors.card,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.ivory,
        surfaceTintColor: Colors.transparent,
      ),
    );
  }
}
