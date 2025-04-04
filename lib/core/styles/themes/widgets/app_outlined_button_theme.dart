import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parky/core/constants/common/global_constant.dart';
import 'package:parky/core/styles/fonts/app_font.dart';

import '../../colors/theme_color.dart';

class AppOutlinedButtonTheme {
  const AppOutlinedButtonTheme._();

  static OutlinedButtonThemeData of(BuildContext context, ThemeColor color) =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          textStyle: AppFont.bodyMedium(
            context,
          )?.copyWith(fontFamily: GlobalConstant.mainFontFamily),
          splashFactory: InkRipple.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.w),
          foregroundColor: color.onBrightnessColor,
          elevation: 0.5,
          backgroundColor: Colors.transparent,
        ),
      );
}
