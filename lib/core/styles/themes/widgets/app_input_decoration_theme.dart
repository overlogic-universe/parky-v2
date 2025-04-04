import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/common/global_constant.dart';
import '../../colors/app_color.dart';
import '../../colors/theme_color.dart';
import '../../fonts/app_font.dart';

class AppInputDecorationTheme {
  const AppInputDecorationTheme._();

  static InputDecorationTheme of(BuildContext context, ThemeColor color) =>
      InputDecorationTheme(
        errorMaxLines: 3,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        hintStyle: AppFont.bodySmall(context)?.copyWith(
          color: Colors.grey,
          fontFamily: GlobalConstant.mainFontFamily,
        ),
        helperStyle: AppFont.bodyMedium(context),
        errorStyle: AppFont.labelSmall(context)?.light.copyWith(
          color: color.error,
          fontFamily: GlobalConstant.mainFontFamily,
        ),
        fillColor: color.primaryFixedDim,
        labelStyle: AppFont.labelMedium(context)?.copyWith(
          color: AppColor.textColor(context),
          fontFamily: GlobalConstant.mainFontFamily,
        ),
        filled: true,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide.none,
        ),
      );
}
