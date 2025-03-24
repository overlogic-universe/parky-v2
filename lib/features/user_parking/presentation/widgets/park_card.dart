import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../../../core/utils/lang.dart';
import 'dotted_line.dart';

class ParkCard extends ConsumerWidget {
  const ParkCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 1.sw,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      padding: EdgeInsets.symmetric(vertical: 15.h),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColor.primary(context),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
            child: GridView(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
                crossAxisSpacing: 10.h,

                mainAxisSpacing: 10.h,
              ),
              children: [
                _buildUserData(
                  context,
                  label: Lang.of(context).entryExitTime,
                  value: "12:00 WIB",
                ),
                _buildUserData(
                  context,
                  label: Lang.of(context).nim,
                  value: "L200220267",
                ),
                _buildUserData(
                  context,
                  label: Lang.of(context).plate,
                  value: "PS 1234 XY",
                ),
                _buildUserData(
                  context,
                  label: Lang.of(context).status,
                  value: "Sedang parkir",
                  isStatus: true,
                ),
              ],
            ),
          ),
          Row(
            children: [
              _buildCardDecoration(context, offsetX: -22.w),
              Expanded(child: DottedLine()),
              _buildCardDecoration(context, offsetX: 22.w),
            ],
          ),
          SizedBox(height: 20.h),
          Container(
            height: 200.w,
            width: 200.w,
            decoration: BoxDecoration(
              color: AppColor.backgroundApp(context),
              borderRadius: BorderRadius.circular(15.r),
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            Lang.of(context).scanHere,
            style: AppFont.labelSmall(
              context,
            )?.medium.copyWith(color: AppColor.onPrimary(context)),
          ),
        ],
      ),
    );
  }

  Widget _buildUserData(
    BuildContext context, {
    required String label,
    required String value,
    bool isStatus = false,
  }) {
    return Column(
      children: [
        Text(
          label,
          style: AppFont.bodySmall(
            context,
          )?.medium.copyWith(color: AppColor.onPrimary(context)),
        ),
        SizedBox(height: 5.h),
        // isStatus
        //     ?
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: AppColor.onPrimary(context),
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Text(value, style: AppFont.labelSmall(context)?.medium),
        ),
        // : Text(
        //   value,
        //   style: AppFont.baseText(context).copyWith(
        //     color: AppColor.onPrimary(context),
        //     fontWeight: FontWeight.w700,
        //   ),
        // ),
      ],
    );
  }

  Widget _buildCardDecoration(BuildContext context, {double offsetX = 0}) {
    final size = 45.w;
    return Transform.translate(
      offset: Offset(offsetX, 0),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: AppColor.backgroundApp(context),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
