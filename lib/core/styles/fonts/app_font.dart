import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/common/global_constant.dart';
import '../colors/theme_color.dart';

class AppFont {
  const AppFont._();

  static const double _scale = 1.0;

  static TextTheme theme(BuildContext context) => Theme.of(context).textTheme;
  
  // Title styles
  static TextStyle? titleSmall(BuildContext context) => theme(context).titleSmall;
  static TextStyle? titleMedium(BuildContext context) => theme(context).titleMedium;
  static TextStyle? titleLarge(BuildContext context) => theme(context).titleLarge;

  // Body styles
  static TextStyle? bodySmall(BuildContext context) => theme(context).bodySmall;
  static TextStyle? bodyMedium(BuildContext context) => theme(context).bodyMedium;
  static TextStyle? bodyLarge(BuildContext context) => theme(context).bodyLarge;

  // Headline styles
  static TextStyle? headlineSmall(BuildContext context) => theme(context).headlineSmall;
  static TextStyle? headlineMedium(BuildContext context) => theme(context).headlineMedium;
  static TextStyle? headlineLarge(BuildContext context) => theme(context).headlineLarge;

  // Display styles
  static TextStyle? displaySmall(BuildContext context) => theme(context).displaySmall;
  static TextStyle? displayMedium(BuildContext context) => theme(context).displayMedium;
  static TextStyle? displayLarge(BuildContext context) => theme(context).displayLarge;

  // Label styles
  static TextStyle? labelSmall(BuildContext context) => theme(context).labelSmall;
  static TextStyle? labelMedium(BuildContext context) => theme(context).labelMedium;
  static TextStyle? labelLarge(BuildContext context) => theme(context).labelLarge;

  static TextStyle baseText(BuildContext context, ThemeColor color) => TextStyle(
        fontFamily: GlobalConstant.mainFontFamily,
        color: color.text,
        fontSize: 14.sp
      );

  static TextStyle text7(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 7.sp * _scale);
  static TextStyle text8(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 8.sp * _scale);
  static TextStyle text9(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 9.sp * _scale);
  static TextStyle text10(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 10.sp * _scale);
  static TextStyle text11(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 11.sp * _scale);
  static TextStyle text12(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 12.sp * _scale);
  static TextStyle text13(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 13.sp * _scale);
  static TextStyle text14(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 14.sp * _scale);
  static TextStyle text15(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 15.sp * _scale);
  static TextStyle text16(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 16.sp * _scale);
  static TextStyle text17(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 17.sp * _scale);
  static TextStyle text18(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 18.sp * _scale);
  static TextStyle text19(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 19.sp * _scale);
  static TextStyle text20(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 20.sp * _scale);
  static TextStyle text21(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 21.sp * _scale);
  static TextStyle text22(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 22.sp * _scale);
  static TextStyle text23(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 23.sp * _scale);
  static TextStyle text24(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 24.sp * _scale);
  static TextStyle text25(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 25.sp * _scale);
  static TextStyle text26(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 26.sp * _scale);
  static TextStyle text27(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 27.sp * _scale);
  static TextStyle text28(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 28.sp * _scale);
  static TextStyle text29(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 29.sp * _scale);
  static TextStyle text30(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 30.sp * _scale);
  static TextStyle text32(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 32.sp * _scale);
  static TextStyle text38(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 38.sp * _scale);
  static TextStyle text40(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 40.sp * _scale);
  static TextStyle text50(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 50.sp * _scale);
  static TextStyle text60(BuildContext context, ThemeColor color) =>
      baseText(context, color).copyWith(fontSize: 60.sp * _scale);

}

extension TextStyleWeightExtension on TextStyle {
  TextStyle get extraThin => copyWith(fontWeight: FontWeight.w100);
  TextStyle get thin => copyWith(fontWeight: FontWeight.w200);
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);
  TextStyle get ultraBold => copyWith(fontWeight: FontWeight.w900);
}

extension TextStyleHelpers on TextStyle {
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
  TextStyle letterSpace(double value) => copyWith(letterSpacing: value);
  TextStyle height(double value) => copyWith(height: value);
}
