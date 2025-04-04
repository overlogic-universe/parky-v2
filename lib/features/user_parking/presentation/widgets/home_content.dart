import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/assets/icon_asset_constant.dart';
import '../../../../core/constants/common/margin_constant.dart';
import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../../../core/utils/get_logo_asset_util.dart';
import '../../../shared/presentation/widgets/margin_bottom.dart';
import '../../../shared/presentation/widgets/svg_asset.dart';
import '../../core/utils/home_util.dart';
import 'park_card.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final double menuIconSize = 35.w;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MarginConstant.horizontalScreen.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(child: SizedBox(height: 10.h)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: SizedBox(
                    width: menuIconSize,
                    height: menuIconSize,
                    child: SvgAsset(
                      asset: IconAssetConstant.menu,
                      color: AppColor.onBackgroundApp(context),
                    ),
                  ),
                ),
                _buildAppLogo(context),
                SizedBox(width: menuIconSize),
              ],
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
            MarginBottom(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppLogo(BuildContext context) {
    final logoAsset = GetLogoAssetUtil.of(context);
    return Image.asset(logoAsset, height: 35.h);
  }
}
