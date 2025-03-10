import 'package:flutter/material.dart';

import '../../colors/theme_color.dart';

class AppTextSelectionTheme {
  const AppTextSelectionTheme._();

  static TextSelectionThemeData of(ThemeColor color) => TextSelectionThemeData(
        cursorColor: color.onBrightnessColor,
        selectionColor: color.secondary.withValues(alpha: 0.5),
        selectionHandleColor: color.primary,
      );
}
