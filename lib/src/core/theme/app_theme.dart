import 'package:ambassador_app/src/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const double radiusSm = 16;
  static const double radiusMd = 24;
  static const double radiusLg = 32;
  static const double radiusXl = 40;

  static ThemeData dark() {
    const scheme = ColorScheme.dark(
      primary: AppColors.accentAmberDark,
      secondary: AppColors.accentSageDark,
      tertiary: AppColors.accentBlueDark,
      surface: AppColors.darkPrimarySurface,
      onSurface: AppColors.darkPrimaryText,
    );
    return _baseTheme(scheme, true);
  }

  static ThemeData light() {
    const scheme = ColorScheme.light(
      primary: AppColors.accentAmberLight,
      secondary: AppColors.accentSageLight,
      tertiary: AppColors.accentBlueLight,
      surface: AppColors.lightPrimarySurface,
      onSurface: AppColors.lightPrimaryText,
    );
    return _baseTheme(scheme, false);
  }

  static ThemeData _baseTheme(ColorScheme scheme, bool isDark) {
    final background = isDark ? AppColors.darkBackground : AppColors.lightBackground;
    final surfaceVariant = isDark ? AppColors.darkSecondarySurface : AppColors.lightSecondarySurface;
    final onSurfaceVariant = isDark ? AppColors.darkSecondaryText : AppColors.lightSecondaryText;

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: background,
      appBarTheme: AppBarTheme(backgroundColor: Colors.transparent, foregroundColor: scheme.onSurface),
      cardTheme: CardThemeData(
        color: scheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusMd)),
        elevation: 0,
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
        side: BorderSide.none,
        backgroundColor: surfaceVariant,
        labelStyle: TextStyle(color: onSurfaceVariant, fontWeight: FontWeight.w600),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(56),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
