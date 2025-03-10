import 'package:flutter/material.dart';
import '../../colors/app_color.dart';

class AppAppBarTheme {
  const AppAppBarTheme._();

  static AppBarTheme of(BuildContext context) => AppBarTheme(
        backgroundColor: AppColor.containerColorBackgroundApp(context),
        scrolledUnderElevation: 0,
        elevation: 0,
      );
}
