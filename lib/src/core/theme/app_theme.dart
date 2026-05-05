import 'package:ambassador_app/src/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const double radiusSm = 14;
  static const double radiusMd = 22;
  static const double radiusLg = 30;
  static const double radiusXl = 38;
  static const double spaceSm = 8;
  static const double spaceMd = 16;
  static const double spaceLg = 24;

  static ThemeData dark() {
    const scheme = ColorScheme.dark(
      primary: AppColors.accentAmberDark,
      secondary: AppColors.accentSageDark,
      tertiary: AppColors.accentBlueDark,
      surface: AppColors.darkPrimarySurface,
      surfaceContainerHighest: AppColors.darkSecondarySurface,
      onSurface: AppColors.darkPrimaryText,
      onSurfaceVariant: AppColors.darkSecondaryText,
      outlineVariant: Color(0x3DF3F2EE),
    );
    return _baseTheme(scheme, true);
  }

  static ThemeData light() {
    const scheme = ColorScheme.light(
      primary: AppColors.accentAmberLight,
      secondary: AppColors.accentSageLight,
      tertiary: AppColors.accentBlueLight,
      surface: AppColors.lightPrimarySurface,
      surfaceContainerHighest: AppColors.lightSecondarySurface,
      onSurface: AppColors.lightPrimaryText,
      onSurfaceVariant: AppColors.lightSecondaryText,
      outlineVariant: Color(0x331C1D22),
    );
    return _baseTheme(scheme, false);
  }

  static ThemeData _baseTheme(ColorScheme scheme, bool isDark) {
    final background = isDark ? AppColors.darkBackground : AppColors.lightBackground;
    final elevated = isDark ? AppColors.darkElevatedSurface : AppColors.lightElevatedSurface;

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: background,
      appBarTheme: AppBarTheme(backgroundColor: Colors.transparent, foregroundColor: scheme.onSurface, centerTitle: false),
      cardTheme: CardThemeData(
        color: scheme.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusMd)),
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
        side: BorderSide.none,
        backgroundColor: scheme.surfaceContainerHighest,
        selectedColor: elevated,
        labelStyle: TextStyle(color: scheme.onSurfaceVariant, fontWeight: FontWeight.w600),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(54),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      textTheme: Typography.material2021().black.apply(
            bodyColor: scheme.onSurface,
            displayColor: scheme.onSurface,
          ),
    );
  }
}
