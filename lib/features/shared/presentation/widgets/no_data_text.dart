import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../../../core/utils/lang.dart';

class NoDataText extends StatelessWidget {
  final Future<void> Function() onRefresh;
  const NoDataText({super.key, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  color: AppColor.backgroundApp(context),
                  border: Border.all(
                    width: 0.3.w,
                    color: AppColor.outlineGrey(context),
                  ),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: IntrinsicHeight(
                  child: Text(
                    Lang.of(context).noData,
                    textAlign: TextAlign.center,
                    style: AppFont.labelMedium(
                      context,
                    )?.copyWith(color: AppColor.disableButton(context)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
