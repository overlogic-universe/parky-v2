import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/theme_color.dart';

class ThemeFont {
  final BuildContext context;
  final ThemeColor color;

  ThemeFont({required this.context, required this.color});

  TextStyle get _baseText => TextStyle(
    color: color.text,
    fontSize: 14.sp,
  );
  TextStyle size(double size) => _baseText.copyWith(fontSize: size.sp);

  TextStyle get text7 => size(7);
  TextStyle get text8 => size(8);
  TextStyle get text9 => size(9);
  TextStyle get text10 => size(10);
  TextStyle get text11 => size(11);
  TextStyle get text12 => size(12);
  TextStyle get text13 => size(13);
  TextStyle get text14 => size(14);
  TextStyle get text15 => size(15);
  TextStyle get text16 => size(16);
  TextStyle get text17 => size(17);
  TextStyle get text18 => size(18);
  TextStyle get text19 => size(19);
  TextStyle get text20 => size(20);
  TextStyle get text21 => size(21);
  TextStyle get text22 => size(22);
  TextStyle get text23 => size(23);
  TextStyle get text24 => size(24);
  TextStyle get text25 => size(25);
  TextStyle get text26 => size(26);
  TextStyle get text27 => size(27);
  TextStyle get text28 => size(28);
  TextStyle get text29 => size(29);
  TextStyle get text30 => size(30);
  TextStyle get text32 => size(32);
  TextStyle get text38 => size(38);
  TextStyle get text40 => size(40);
  TextStyle get text50 => size(50);
  TextStyle get text60 => size(60);
}
