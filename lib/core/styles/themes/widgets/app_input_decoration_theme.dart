import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../colors/app_color.dart';
import '../../colors/theme_color.dart';
import '../../fonts/app_font.dart';

class AppInputDecorationTheme {
  const AppInputDecorationTheme._();

  static InputDecorationTheme of(BuildContext context, ThemeColor color) =>
      InputDecorationTheme(
        errorMaxLines: 3,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
        hintStyle: AppFont.bodyMedium(context)?.copyWith(color: Colors.grey),
        helperStyle: AppFont.bodyMedium(context),
        errorStyle: AppFont.bodySmall(context)
            ?.copyWith(color: AppColor.error(context)),
        fillColor: Colors.transparent,
        labelStyle: AppFont.labelMedium(context)
            ?.copyWith(color: AppColor.textColor(context)),
        filled: true,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(width: 0.8.w, color: color.error),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(width: 0.8.w, color: color.error),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(width: 0.8.w, color: color.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(width: 0.8.w, color: color.onBrightnessColor),
        ),
      );
}
