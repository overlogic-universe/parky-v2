import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/assets/image_asset_constant.dart';
import '../../../../core/constants/common/margin_constant.dart';
import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../core/utils/home_util.dart';
import 'park_card.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MarginConstant.horizontalScreen.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(child: SizedBox(height: 10.h)),
            Center(
              child: Image.asset(ImageAssetConstant.appLogo, height: 40.h),
            ),
            SizedBox(height: 40.h),
            Text(
              HomeUtil.getHomeGreeting(context),
              style: AppFont.displaySmall(context),
            ),
            Text(
              HomeUtil.getMiddleName("Muhammad Rafli Silehu"),
              style: AppFont.displayLarge(
                context,
              )?.copyWith(color: AppColor.primary(context)),
            ),
            SizedBox(height: 30.h),
            ParkCard(),
            SizedBox(height: MarginConstant.marginBottom),
          ],
        ),
      ),
    );
  }
}
