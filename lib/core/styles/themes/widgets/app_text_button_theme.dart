import 'package:flutter/material.dart';

import '../../colors/theme_color.dart';
import '../../fonts/app_font.dart';

class AppTextButtonTheme {
  const AppTextButtonTheme._();

  static TextButtonThemeData of(BuildContext context, ThemeColor color) =>
      TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(color.primary),
          textStyle: WidgetStatePropertyAll(
            AppFont.text16(context, color).copyWith(color: color.primary),
          ),
        ),
      );
}
