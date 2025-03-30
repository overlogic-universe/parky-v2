import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/styles/colors/app_color.dart';
import '../widgets/screen_decoration.dart';
import 'base_screen.dart';

class BaseScreenWithDecoration extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget child;
  final bool resizeToAvoidBottomInset;
  final double? horizontalPadding;
  final bool useSafeArea;

  const BaseScreenWithDecoration({
    super.key,
    this.appBar,
    this.drawer,
    required this.child,
    this.resizeToAvoidBottomInset = false,
    this.horizontalPadding,
    this.useSafeArea = false,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      horizontalPadding: horizontalPadding,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      useSafeArea: useSafeArea,
      appBar: appBar,
      drawer: drawer,
      child: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ScreenDecoration(
              top: 10.h,
              right: -30.w,
              size: 200,
              color: AppColor.primary(context),
            ),
            ScreenDecoration(
              bottom: 20.h,
              left: -60.w,
              size: 200,
              color: AppColor.primary(context),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
