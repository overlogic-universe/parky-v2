import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/app_font.dart';

class AsyncUserInfoTile extends StatelessWidget {
  final String label;
  final AsyncValue<String> value;
  final AsyncValue<String>? value2;

  const AsyncUserInfoTile({
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
        value.when(
          data: (val) => _buildBox(context, val),
          loading: () => _buildLoadingBox(context),
          error: (_, __) => _buildBox(context, ""),
        ),
        if (value2 != null) ...[
          SizedBox(height: 5.h),
          value2!.when(
            data: (val) => _buildBox(context, val),
            loading: () => _buildLoadingBox(context),
            error: (_, __) => _buildBox(context, ""),
          ),
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

  Widget _buildLoadingBox(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(height: 16.h, width: 80.w, color: Colors.white),
      ),
    );
  }
}
