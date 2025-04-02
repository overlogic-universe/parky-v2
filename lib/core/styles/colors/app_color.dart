import 'package:flutter/material.dart';

class AppColor {
  const AppColor._();

  static ColorScheme theme(BuildContext context) => Theme.of(context).colorScheme;

  static Color primary(BuildContext context) => theme(context).primary;
  static Color onPrimary(BuildContext context) => theme(context).onPrimary;
  static Color borderPrimary(BuildContext context) => theme(context).primary;
  static Color containerColorPrimary(BuildContext context) => theme(context).primaryContainer;
  static Color onContainerColorPrimary(BuildContext context) => theme(context).onPrimaryContainer;
  static Color primaryDarker(BuildContext context) => theme(context).primaryFixedDim;

  static Color secondary(BuildContext context) => theme(context).secondary;
  static Color onSecondary(BuildContext context) => theme(context).onSecondary;
  static Color borderSecondary(BuildContext context) => theme(context).secondary;
  static Color containerColorSecondary(BuildContext context) => theme(context).secondaryContainer;
  static Color onContainerColorSecondary(BuildContext context) => theme(context).onSecondaryContainer;

  static Color tertiary(BuildContext context) => theme(context).tertiary;
  static Color onTertiary(BuildContext context) => theme(context).onTertiary;
  static Color borderTertiary(BuildContext context) => theme(context).tertiary;
  static Color containerColorTertiary(BuildContext context) => theme(context).tertiaryContainer;
  static Color onContainerColorTertiary(BuildContext context) => theme(context).onTertiaryContainer;

  static Color backgroundApp(BuildContext context) => theme(context).surface;
  static Color onBackgroundApp(BuildContext context) => theme(context).onSurface;
  static Color borderBackgroundApp(BuildContext context) => theme(context).surfaceContainerLow;
  static Color containerColorBackgroundApp(BuildContext context) => theme(context).surfaceContainer;
  static Color onContainerColorBackgroundApp(BuildContext context) => theme(context).onSurfaceVariant;

  static Color textColor(BuildContext context) => theme(context).onSurface;
  static Color brightnessColor(BuildContext context) => theme(context).onInverseSurface;
  static Color onBrightnessColor(BuildContext context) => theme(context).inverseSurface;

  static Color disableButton(BuildContext context) => theme(context).surfaceContainerHigh;
  static Color disableTextOrIcon(BuildContext context) => theme(context).surfaceContainerHigh;

  static Color error(BuildContext context) => theme(context).error;
  static Color containerColorError(BuildContext context) => theme(context).errorContainer;
  static Color onError(BuildContext context) => theme(context).onError;

  static Color success(BuildContext context) => theme(context).inverseSurface;
  static Color onSuccess(BuildContext context) => theme(context).onInverseSurface;
  
  static Color outlineGrey(BuildContext context) => theme(context).outline;
  static Color outlineLightGrey(BuildContext context) => theme(context).outlineVariant;
  static Color shadow(BuildContext context) =>theme(context).shadow;

  static Color inputBackground(BuildContext context) => theme(context).primaryFixedDim;

}
