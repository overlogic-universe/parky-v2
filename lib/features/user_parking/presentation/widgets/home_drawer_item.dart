import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/assets/icon_asset_constant.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../../../core/utils/lang.dart';
import '../../../shared/presentation/widgets/line.dart';
import '../../../shared/presentation/widgets/svg_asset.dart';
import '../models/drawer_item_model.dart';

class HomeDrawerItem extends StatelessWidget {
  const HomeDrawerItem({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DrawerItemModel> items = [
      DrawerItemModel(
        name: Lang.of(context).setting,
        icon: IconAssetConstant.setting,
      ),
      DrawerItemModel(
        name: Lang.of(context).logout,
        icon: IconAssetConstant.logout,
        isLogout: true,
      ),
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
                      icon: item.icon,
                      name: item.name,
                      isLogout: item.isLogout,
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }

  GestureDetector _buildItem(
    BuildContext context, {
    required String icon,
    required String name,
    bool isLogout = false,
  }) {
    return GestureDetector(
      onTap: () => _handleSelectItem(context, name),
      child: Column(
        children: [
          if (isLogout)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Line(),
            ),
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
      ),
    );
  }

  void _handleSelectItem(BuildContext context, String name) {
    if (name == Lang.of(context).setting) {
      Navigator.pushNamed(context, RouteName.setting);
    }
  }
}
