import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parky/core/constants/common/global_constant.dart';
import 'package:parky/core/styles/fonts/app_font.dart';

import '../../colors/theme_color.dart';

class AppElevatedButtonTheme {
  const AppElevatedButtonTheme._();

  static ElevatedButtonThemeData of(BuildContext context, ThemeColor color) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: AppFont.bodyMedium(
            context,
          )?.copyWith(fontFamily: GlobalConstant.mainFontFamily),
          splashFactory: InkRipple.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.w),
          foregroundColor: color.onPrimary,

          elevation: 0.5,
          backgroundColor: color.primary,
        ),
      );
}
