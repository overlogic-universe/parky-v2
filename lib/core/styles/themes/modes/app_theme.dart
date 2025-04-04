import 'package:flutter/material.dart';

import '../../../constants/common/global_constant.dart';
import '../../colors/theme_color.dart';
import '../../fonts/app_text_theme.dart';
import '../../fonts/theme_font.dart';
import '../color_scheme/app_color_scheme.dart';
import '../widgets/app_app_bar_theme.dart';
import '../widgets/app_elevated_button_theme.dart';
import '../widgets/app_input_decoration_theme.dart';
import '../widgets/app_progress_indicator_theme.dart';
import '../widgets/app_text_button_theme.dart';
import '../widgets/app_text_selection_theme.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData of(
    BuildContext context,
    ThemeColor color,
    ThemeFont themeFont,
  ) => ThemeData(
    fontFamily: GlobalConstant.mainFontFamily,
    primaryColor: color.primary,
    scaffoldBackgroundColor: color.surface,
    indicatorColor: color.primary,
    hintColor: color.grey,
    highlightColor: color.grey,
    focusColor: color.onBrightnessColor,
    disabledColor: color.grey,
    cardColor: color.brightnessColor,
    shadowColor: color.shadow,
    dividerColor: color.grey,
    unselectedWidgetColor: color.grey,
    appBarTheme: AppAppBarTheme.of(context, color),
    elevatedButtonTheme: AppElevatedButtonTheme.of(context, color),
    progressIndicatorTheme: AppProgressIndicatorTheme.of(color),
    textTheme: AppTextTheme.of(context, themeFont),
    textButtonTheme: AppTextButtonTheme.of(context, color),
    textSelectionTheme: AppTextSelectionTheme.of(color),
    inputDecorationTheme: AppInputDecorationTheme.of(context, color),
    splashFactory: InkRipple.splashFactory,
    colorScheme: AppColorScheme.of(color),
    dialogTheme: DialogThemeData(backgroundColor: color.brightnessColor),
  );
}
