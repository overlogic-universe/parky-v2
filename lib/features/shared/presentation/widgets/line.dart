import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/styles/colors/app_color.dart';

class Line extends StatelessWidget {
  final Color? color;
  final double height;
  final double? width;
  const Line({super.key, this.height = 0.4, this.color, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width,
      color: color ?? AppColor.outlineGrey(context),
    );
  }
}