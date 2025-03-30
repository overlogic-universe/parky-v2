import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../../common/widgets/line.dart';
import '../models/setting_item_model.dart';

class BaseSettingCard extends StatelessWidget {
  final List<SettingItemModel> settingItemList;
  final String? label;
  const BaseSettingCard({super.key, required this.settingItemList, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColor.backgroundApp(context),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(width: 0.1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) ...[
            Text(label!, style: AppFont.titleMedium(context)),
            SizedBox(height: 15.h),
          ],
          Column(
            children: List.generate(
              settingItemList.length,
              (index) => _buildColumnItem(context, index, settingItemList),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColumnItem(
    BuildContext context,
    int index,
    List<SettingItemModel> items,
  ) {
    final SettingItemModel item = items[index];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(item.name), item.suffixWidget],
        ),
        SizedBox(height: 5.h),
        Line(),
        SizedBox(height: 12.h),
      ],
    );
  }
}
