import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/assets/image_asset_constant.dart';
import '../../../../core/constants/common/margin_constant.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../../../core/utils/lang.dart';

class LoginWithStudentEmailButton extends ConsumerWidget {
  const LoginWithStudentEmailButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 1.sw,
      height: 50.h,
      margin: EdgeInsets.symmetric(
        horizontal: MarginConstant.horizontalScreen.w,
      ),
      child: OutlinedButton(
        onPressed: () {},
        child: Row(
          children: [
            Image.asset(ImageAssetConstant.googleLogo, height: 20.h),
            SizedBox(width: 10.w),
            Text(
              Lang.of(context).loginWithStudentEmail,
              style: AppFont.labelMedium(context),
            ),
          ],
        ),
      ),
    );
  }
}
