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
      primary: AppColors.champagneGold,
      secondary: AppColors.bronzeAccent,
      surface: AppColors.cardDeep,
      onPrimary: AppColors.graphiteBlack,
      onSecondary: AppColors.softIvory,
      onSurface: AppColors.softIvory,
      error: Colors.redAccent,
      onError: Colors.white,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.graphiteBlack,
      textTheme: const TextTheme(
        displaySmall: TextStyle(color: AppColors.softIvory, fontSize: 35, fontWeight: FontWeight.w700, height: 1.08, letterSpacing: -0.2),
        headlineMedium: TextStyle(color: AppColors.softIvory, fontSize: 29, fontWeight: FontWeight.w700),
        titleLarge: TextStyle(color: AppColors.softIvory, fontWeight: FontWeight.w600, fontSize: 22, letterSpacing: 0.2),
        titleMedium: TextStyle(color: AppColors.softIvory, fontWeight: FontWeight.w600, fontSize: 16, height: 1.35),
        bodyLarge: TextStyle(color: AppColors.softIvory, height: 1.5),
        bodyMedium: TextStyle(color: AppColors.slateSteel, height: 1.45),
      ),
      cardTheme: CardThemeData(
        color: AppColors.cardDeep,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusMd)),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.softIvory,
        surfaceTintColor: Colors.transparent,
      ),
      dividerColor: AppColors.glass,
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.champagneGold,
          foregroundColor: AppColors.graphiteBlack,
          minimumSize: const Size.fromHeight(54),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusMd)),
          textStyle: const TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.25),
        ),
      ),
    );
  }
}
