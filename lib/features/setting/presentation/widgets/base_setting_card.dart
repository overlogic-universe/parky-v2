import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../../shared/presentation/widgets/line.dart';
import '../models/setting_item_model.dart';

class BaseSettingCard extends StatelessWidget {
  final List<SettingItemModel> settingItemList;
  final String? label;
  final Color? textColor;
  final void Function(SettingItemModel item)? onTap;

  const BaseSettingCard({
    super.key,
    required this.settingItemList,
    this.label,
    this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: AppColor.backgroundApp(context),
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          width: 0.1.w,
          color: AppColor.disableTextOrIcon(context),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) ...[
            Text(label!, style: AppFont.titleMedium(context)),
            SizedBox(height: 15.h),
          ],
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: settingItemList.length,
            itemBuilder:
                (context, index) =>
                    _buildColumnItem(context, settingItemList[index]),
          ),
        ],
      ),
    );
  }

  Widget _buildColumnItem(BuildContext context, SettingItemModel item) {
    return GestureDetector(
      onTap: () => onTap?.call(item),
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(item.name, style: TextStyle(color: textColor),), item.suffixWidget],
            ),
            SizedBox(height: 5.h),
            Line(),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}
