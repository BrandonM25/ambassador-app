import 'package:flutter/material.dart';

class AppTheme {
  static const double radiusSm = 18;
  static const double radiusMd = 30;
  static const double radiusLg = 36;
  static const double spaceSm = 10;
  static const double spaceMd = 18;
  static const double spaceLg = 26;

  static ThemeData dark() {
    const scheme = ColorScheme.dark(
      primary: Color(0xFFDCC8A6),
      secondary: Color(0xFF9FB0B8),
      tertiary: Color(0xFF8CA2BF),
      surface: Color(0xFF171A20),
      surfaceContainerHighest: Color(0xFF252A32),
      onSurface: Color(0xFFF4F0E8),
      onSurfaceVariant: Color(0xFFB7BDC9),
    );
    return _baseTheme(scheme, true);
  }

  static ThemeData light() {
    const scheme = ColorScheme.light(
      primary: Color(0xFF3B3C42),
      secondary: Color(0xFF5A606D),
      tertiary: Color(0xFF6B7891),
      surface: Color(0xFFF2EEE7),
      surfaceContainerHighest: Color(0xFFE7E2DA),
      onSurface: Color(0xFF1D212A),
      onSurfaceVariant: Color(0xFF5D6572),
    );
    return _baseTheme(scheme, false);
  }

  static ThemeData _baseTheme(ColorScheme scheme, bool isDark) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: isDark ? const Color(0xFF0F1218) : const Color(0xFFFCFAF6),
      textTheme: Typography.material2021().black.apply(bodyColor: scheme.onSurface, displayColor: scheme.onSurface).copyWith(
            displaySmall: const TextStyle(fontWeight: FontWeight.w800, letterSpacing: -0.8),
            headlineMedium: const TextStyle(fontWeight: FontWeight.w800, letterSpacing: -0.5),
            titleLarge: const TextStyle(fontWeight: FontWeight.w700),
          ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
        side: BorderSide.none,
        backgroundColor: scheme.surfaceContainerHighest.withValues(alpha: .9),
        selectedColor: scheme.primary.withValues(alpha: .22),
        labelStyle: TextStyle(color: scheme.onSurfaceVariant, fontWeight: FontWeight.w600),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          foregroundColor: isDark ? Colors.black : Colors.white,
          backgroundColor: scheme.primary,
          minimumSize: const Size.fromHeight(58),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
