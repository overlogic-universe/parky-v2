import 'package:flutter/material.dart';

import '../../utils/lang.dart';

part 'modes/orb_theme_color.dart';
part 'modes/main_theme_color.dart';

enum ThemeModeType { main, orb }

extension ThemeModeTypeExtension on ThemeModeType {
  String displayName(BuildContext context) {
    switch (this) {
      case ThemeModeType.main:
        return Lang.of(context).mainTheme;
      case ThemeModeType.orb:
        return Lang.of(context).orbTheme;
    }
  }
}

abstract class ThemeColor {
  static ThemeColor of(ThemeModeType themeModeType) {
    switch (themeModeType) {
      case ThemeModeType.main:
        return MainThemeColor();
      case ThemeModeType.orb:
        return OrbThemeColor();
    }
  }
  Brightness get brightness;

  // Primary colors
  Color get primary;
  Color get onPrimary;
  Color get primaryContainer;
  Color get onPrimaryContainer;
  Color get primaryFixed;
  Color get primaryFixedDim;
  Color get inversePrimary;

  // Secondary colors
  Color get secondary;
  Color get onSecondary;
  Color get secondaryContainer;
  Color get onSecondaryContainer;
  Color get secondaryFixed;
  Color get secondaryFixedDim;

  // Tertiary colors
  Color get tertiary;
  Color get onTertiary;
  Color get tertiaryContainer;
  Color get onTertiaryContainer;
  Color get tertiaryFixed;
  Color get tertiaryFixedDim;

  // Surface colors
  Color get surface;
  Color get onSurface;
  Color get surfaceBright;
  Color get surfaceDim;
  Color get surfaceContainer;
  Color get surfaceContainerLow;
  Color get surfaceContainerHigh;
  Color get surfaceContainerHighest;
  Color get surfaceContainerLowest;
  Color get surfaceTint;
  Color get inverseSurface;
  Color get onInverseSurface;

  // Error colors
  Color get error;
  Color get onError;
  Color get errorContainer;
  Color get onErrorContainer;

  // Success colors
  Color get success;
  Color get onSuccess;

  // Outline and shadow
  Color get outline;
  Color get outlineVariant;
  Color get shadow;
  Color get scrim;

  // Background and neutral colors
  Color get lightGrey;
  Color get grey;
  Color get brightnessColor;
  Color get onBrightnessColor;

  // others
  Color get text;
}
