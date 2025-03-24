import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/assets/icon_asset_constant.dart';
import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../../../core/utils/lang.dart';
import '../../../common/widgets/line.dart';
import '../../../common/widgets/svg_asset.dart';

class HomeDrawerItem extends StatelessWidget {
  const HomeDrawerItem({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        "name": Lang.of(context).setting,
        "icon": IconAssetConstant.setting,
        "isLogout": false,
      },
      {
        "name": Lang.of(context).logout,
        "icon": IconAssetConstant.logout,
        "isLogout": true,
      },
    ];
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Column(
          children:
              items
                  .map(
                    (item) => _buildItem(
                      context,
                      icon: item["icon"],
                      name: item["name"],
                      isLogout: item["name"] == Lang.of(context).logout,
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }

  Column _buildItem(
    BuildContext context, {
    required String icon,
    required String name,
    bool isLogout = false,
  }) {
    return Column(
      children: [
        if (isLogout)
          Padding(padding: EdgeInsets.symmetric(vertical: 10.h), child: Line()),
        Container(
          color: Colors.transparent,
          child: Row(
            children: [
              SvgAsset(
                asset: icon,
                size: 25,
                color:
                    isLogout
                        ? AppColor.error(context)
                        : AppColor.textColor(context),
              ),
              SizedBox(width: 10.w),
              Text(
                name,
                style: AppFont.labelMedium(context)?.copyWith(
                  color:
                      isLogout
                          ? AppColor.error(context)
                          : AppColor.textColor(context),
                ),
              ),
              Spacer(),
              if (!isLogout)
                SvgAsset(asset: IconAssetConstant.arrowForward, size: 25),
            ],
          ),
        ),
      ],
    );
  }
}
