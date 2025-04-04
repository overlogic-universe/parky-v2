import 'package:flutter/material.dart';

class AppFont {
  const AppFont._();

  static TextTheme _theme(BuildContext context) => Theme.of(context).textTheme;

  // Title
  static TextStyle? titleSmall(BuildContext context) => _theme(context).titleSmall;
  static TextStyle? titleMedium(BuildContext context) => _theme(context).titleMedium;
  static TextStyle? titleLarge(BuildContext context) => _theme(context).titleLarge;

  // Body
  static TextStyle? bodySmall(BuildContext context) => _theme(context).bodySmall;
  static TextStyle? bodyMedium(BuildContext context) => _theme(context).bodyMedium;
  static TextStyle? bodyLarge(BuildContext context) => _theme(context).bodyLarge;

  // Headline
  static TextStyle? headlineSmall(BuildContext context) => _theme(context).headlineSmall;
  static TextStyle? headlineMedium(BuildContext context) => _theme(context).headlineMedium;
  static TextStyle? headlineLarge(BuildContext context) => _theme(context).headlineLarge;

  // Display
  static TextStyle? displaySmall(BuildContext context) => _theme(context).displaySmall;
  static TextStyle? displayMedium(BuildContext context) => _theme(context).displayMedium;
  static TextStyle? displayLarge(BuildContext context) => _theme(context).displayLarge;

  // Label
  static TextStyle? labelSmall(BuildContext context) => _theme(context).labelSmall;
  static TextStyle? labelMedium(BuildContext context) => _theme(context).labelMedium;
  static TextStyle? labelLarge(BuildContext context) => _theme(context).labelLarge;
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
