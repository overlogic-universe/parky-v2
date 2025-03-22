import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parky/core/styles/colors/app_color.dart';
import 'package:parky/core/styles/fonts/app_font.dart';
import 'package:parky/core/utils/lang.dart';

class RememberMe extends ConsumerWidget {
  const RememberMe({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double checkBoxSize = 20.w;
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: Row(
          spacing: 10.w,
          children: [
            Container(
              height: checkBoxSize,
              width: checkBoxSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: AppColor.primary(context),
              ),
              child: Icon(
                Icons.check_rounded,
                color: AppColor.onPrimary(context),
                size: 15.r,
              ),
            ),
            Text(
              Lang.of(context).rememberMe,
              style: AppFont.labelMedium(context),
            ),
          ],
        ),
      ),
    );
  }
}
