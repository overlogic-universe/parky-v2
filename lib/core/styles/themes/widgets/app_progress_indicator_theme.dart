import 'package:flutter/material.dart';

import '../../colors/theme_color.dart';

class AppProgressIndicatorTheme {
  const AppProgressIndicatorTheme._();

  static ProgressIndicatorThemeData of(ThemeColor color) =>
      ProgressIndicatorThemeData(
        color: color.primary,
        linearTrackColor: color.primary,
        circularTrackColor: color.grey,
      );
}
