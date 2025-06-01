import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../../../core/utils/lang.dart';

class StudentInfoTile extends StatelessWidget {
  final String label;
  final String? value;
  final double? valueFontSize;
  final bool isLoading;

  const StudentInfoTile({
    super.key,
    required this.label,
    this.value,
    this.valueFontSize,
    this.isLoading = false,
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
        isLoading
            ? _buildShimmer(context)
            : value != null
            ? _buildBox(context, value!)
            : Text(
              Lang.of(context).noData,
              style: AppFont.labelSmall(context)?.regular.copyWith(
                color: AppColor.outlineGrey(context),
                fontSize: 11.sp,
              ),
            ),
      ],
    );
  }

  Widget _buildBox(BuildContext context, String val) {
    return Container(
      width: 110.w,
      padding: EdgeInsets.all(5.r),
      decoration: BoxDecoration(
        color: AppColor.containerColorPrimary(context),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Center(
        child: Text(
          val,
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: AppFont.labelSmall(context)?.medium.copyWith(
            color: _getValueTextColor(context),
            fontSize: (valueFontSize ?? 11).sp,
          ),
        ),
      ),
    );
  }

  Color _getValueTextColor(BuildContext context) {
    if (value == Lang.of(context).parked) {
      return AppColor.success(context);
    } else if (value == Lang.of(context).exited) {
      return AppColor.error(context);
    } else {
      return AppColor.onContainerColorPrimary(context);
    }
  }

  Widget _buildShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.baseShimmerColor(context),
      highlightColor: AppColor.highlightShimmerColor(context),
      child: Container(
        width: 110.w,
        height: 25.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.r),
        ),
      ),
    );
  }
}
