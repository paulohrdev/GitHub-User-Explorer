import 'package:flutter/material.dart';

abstract final class AppColors {
  // Surfaces
  static const surface = Color(0xFF10141A);
  static const surfaceDim = Color(0xFF10141A);
  static const surfaceBright = Color(0xFF353940);
  static const surfaceContainerLowest = Color(0xFF0A0E14);
  static const surfaceContainerLow = Color(0xFF181C22);
  static const surfaceContainer = Color(0xFF1C2026);
  static const surfaceContainerHigh = Color(0xFF262A31);
  static const surfaceContainerHighest = Color(0xFF31353C);

  // On surface
  static const onSurface = Color(0xFFDFE2EB);
  static const onSurfaceVariant = Color(0xFFC0C7D4);
  static const inverseSurface = Color(0xFFDFE2EB);
  static const inverseOnSurface = Color(0xFF2D3137);

  // Outline
  static const outline = Color(0xFF8B919D);
  static const outlineVariant = Color(0xFF414752);
  static const surfaceTint = Color(0xFFA2C9FF);

  // Primary
  static const primary = Color(0xFFA2C9FF);
  static const onPrimary = Color(0xFF00315C);
  static const primaryContainer = Color(0xFF58A6FF);
  static const onPrimaryContainer = Color(0xFF003A6B);
  static const inversePrimary = Color(0xFF0060AA);

  // Secondary
  static const secondary = Color(0xFFC1C7D0);
  static const onSecondary = Color(0xFF2B3138);
  static const secondaryContainer = Color(0xFF41474F);
  static const onSecondaryContainer = Color(0xFFB0B5BE);

  // Tertiary
  static const tertiary = Color(0xFF67DF70);
  static const onTertiary = Color(0xFF00390D);
  static const tertiaryContainer = Color(0xFF40BA51);
  static const onTertiaryContainer = Color(0xFF004411);

  // Error
  static const error = Color(0xFFFFB4AB);
  static const onError = Color(0xFF690005);
  static const errorContainer = Color(0xFF93000A);
  static const onErrorContainer = Color(0xFFFFDAD6);

  // Fixed variants
  static const primaryFixed = Color(0xFFD3E4FF);
  static const primaryFixedDim = Color(0xFFA2C9FF);
  static const onPrimaryFixed = Color(0xFF001C38);
  static const onPrimaryFixedVariant = Color(0xFF004882);
  static const secondaryFixed = Color(0xFFDDE3EC);
  static const secondaryFixedDim = Color(0xFFC1C7D0);
  static const onSecondaryFixed = Color(0xFF161C23);
  static const onSecondaryFixedVariant = Color(0xFF41474F);
  static const tertiaryFixed = Color(0xFF83FC89);
  static const tertiaryFixedDim = Color(0xFF67DF70);
  static const onTertiaryFixed = Color(0xFF002105);
  static const onTertiaryFixedVariant = Color(0xFF005317);

  // Background
  static const background = Color(0xFF10141A);
  static const onBackground = Color(0xFFDFE2EB);
  static const surfaceVariant = Color(0xFF31353C);

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
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
    surface: surface,
    onSurface: onSurface,
    surfaceDim: surfaceDim,
    surfaceBright: surfaceBright,
    surfaceContainerLowest: surfaceContainerLowest,
    surfaceContainerLow: surfaceContainerLow,
    surfaceContainer: surfaceContainer,
    surfaceContainerHigh: surfaceContainerHigh,
    surfaceContainerHighest: surfaceContainerHighest,
    onSurfaceVariant: onSurfaceVariant,
    outline: outline,
    outlineVariant: outlineVariant,
    inverseSurface: inverseSurface,
    onInverseSurface: inverseOnSurface,
    inversePrimary: inversePrimary,
    surfaceTint: surfaceTint,
  );
}