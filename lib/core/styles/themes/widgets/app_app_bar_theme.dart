import 'package:flutter/material.dart';

import '../../colors/theme_color.dart';

class AppAppBarTheme {
  const AppAppBarTheme._();

  static AppBarTheme of(BuildContext context, ThemeColor color) => AppBarTheme(
    backgroundColor: color.surfaceContainer,
    scrolledUnderElevation: 0,
    elevation: 0,
  );
}
