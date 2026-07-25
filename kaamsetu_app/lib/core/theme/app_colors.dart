import 'package:flutter/material.dart';

class AppColors {
  // Primary
  static const Color primary = Color(0xFF00450D);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFF1B5E20);
  static const Color onPrimaryContainer = Color(0xFF90D689);
  static const Color inversePrimary = Color(0xFF91D78A);
  static const Color primaryFixed = Color(0xFF91D78A);
  static const Color onPrimaryFixed = Color(0xFF002104);
  static const Color primaryFixedDim = Color(0xFF77BA71);
  static const Color onPrimaryFixedVariant = Color(0xFF005312);

  // Secondary
  static const Color secondary = Color(0xFF835400);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFFCAB28);
  static const Color onSecondaryContainer = Color(0xFF694300);
  static const Color secondaryFixed = Color(0xFFFFDDB2);
  static const Color onSecondaryFixed = Color(0xFF291800);
  static const Color secondaryFixedDim = Color(0xFFFFB94F);
  static const Color onSecondaryFixedVariant = Color(0xFF633F00);

  // Tertiary
  static const Color tertiary = Color(0xFF323E36);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFF49554C);
  static const Color onTertiaryContainer = Color(0xFFBCC9BE);
  static const Color tertiaryFixed = Color(0xFFD3E0D4);
  static const Color onTertiaryFixed = Color(0xFF0E1912);
  static const Color tertiaryFixedDim = Color(0xFFB7C4B9);
  static const Color onTertiaryFixedVariant = Color(0xFF3B473F);

  // Error
  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF93000A);

  // Background & Surface
  static const Color background = Color(0xFFFCF9F8);
  static const Color onBackground = Color(0xFF1B1C1C);
  static const Color surface = Color(0xFFFCF9F8);
  static const Color onSurface = Color(0xFF1B1C1C);
  static const Color surfaceVariant = Color(0xFFE5E2E1);
  static const Color onSurfaceVariant = Color(0xFF41493E);
  
  // Surface Containers (Material 3)
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFF6F3F2);
  static const Color surfaceContainer = Color(0xFFF0EDED);
  static const Color surfaceContainerHigh = Color(0xFFEAE7E7);
  static const Color surfaceContainerHighest = Color(0xFFE5E2E1);
  static const Color surfaceDim = Color(0xFFDCD9D9);
  static const Color surfaceBright = Color(0xFFFCF9F8);

  // Outline
  static const Color outline = Color(0xFF717A6D);
  static const Color outlineVariant = Color(0xFFC0C9BB);
  static const Color surfaceTint = Color(0xFF2A6B2C);

  // Legacy mappings for older code (keep them available if needed)
  static const Color textPrimary = onSurface;
  static const Color textSecondary = onSurfaceVariant;

  static const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: onPrimary,
    primaryContainer: primaryContainer,
    onPrimaryContainer: onPrimaryContainer,
    secondary: secondary,
    onSecondary: onSecondary,
    secondaryContainer: secondaryContainer,
    onSecondaryContainer: onSecondaryContainer,
    tertiary: tertiary,
    onTertiary: onTertiary,
    tertiaryContainer: tertiaryContainer,
    onTertiaryContainer: onTertiaryContainer,
    error: error,
    onError: onError,
    errorContainer: errorContainer,
    onErrorContainer: onErrorContainer,
    background: background,
    onBackground: onBackground,
    surface: surface,
    onSurface: onSurface,
    surfaceVariant: surfaceVariant,
    onSurfaceVariant: onSurfaceVariant,
    outline: outline,
    outlineVariant: outlineVariant,
    inverseSurface: Color(0xFF303030),
    onInverseSurface: Color(0xFFF3F0EF),
    inversePrimary: inversePrimary,
    surfaceTint: surfaceTint,
  );
}
