import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/styles/colors/app_color.dart';

class SvgAsset extends StatelessWidget {
  final String asset;
  final Color? color;
  final double size;
  const SvgAsset({super.key, required this.asset, this.color, this.size = 25});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.h,
      width: size.w,
      child: SvgPicture.asset(
        asset,
        colorFilter: ColorFilter.mode(
          color ?? AppColor.textColor(context),
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
