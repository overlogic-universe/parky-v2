import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parky/core/constants/assets/image_asset_constant.dart';
import 'package:parky/core/styles/fonts/app_font.dart';

import '../../../../core/styles/colors/app_color.dart';
import 'home_drawer_item.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw * 0.8,
      height: 1.sh,
      decoration: BoxDecoration(color: AppColor.backgroundApp(context)),
      child: Column(
        children: [
          Container(
            height: 180.h,
            width: 1.sw,
            padding: EdgeInsets.all(10.r),
            color: AppColor.primary(context),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(ImageAssetConstant.appLogoWhite, height: 60.h),
                  Spacer(),
                  Text(
                    "Muhammad Rafli Silehu",
                    overflow: TextOverflow.ellipsis,
                    style: AppFont.bodyLarge(
                      context,
                    )?.semiBold.copyWith(color: AppColor.onPrimary(context)),
                  ),
                  Text(
                    "l200220267@student.ums.ac.id",
                    overflow: TextOverflow.ellipsis,

                    style: AppFont.labelMedium(
                      context,
                    )?.copyWith(color: AppColor.outlineLightGrey(context)),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
          SizedBox(height: 5.h),
          HomeDrawerItem(),
        ],
      ),
    );
  }
}
