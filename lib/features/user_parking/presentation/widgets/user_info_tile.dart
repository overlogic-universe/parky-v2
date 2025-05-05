import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/app_font.dart';

class UserInfoTile extends StatelessWidget {
  final String label;
  final String value;
  final String? value2;

  const UserInfoTile({
    super.key,
    required this.label,
    required this.value,
    this.value2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: AppFont.bodySmall(
            context,
          )?.medium.copyWith(color: AppColor.onPrimary(context)),
        ),
        SizedBox(height: 5.h),
        _buildBox(context, value),

        if (value2 != null) ...[
          SizedBox(height: 5.h),
          _buildBox(context, value2!),
        ],
      ],
    );
  }

  Widget _buildBox(BuildContext context, String val) {
    return Container(
      width: 110.w,
      height: 25.h,
      decoration: BoxDecoration(
        color: AppColor.containerColorPrimary(context),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Center(
        child: Text(
          val,
          style: AppFont.labelSmall(context)?.medium.copyWith(
            color: AppColor.onContainerColorPrimary(context),
            fontSize: 11.sp,
          ),
        ),
      ),
    );
  }
}
