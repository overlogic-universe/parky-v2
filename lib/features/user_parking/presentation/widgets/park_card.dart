import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../../../core/utils/lang.dart';
import '../../../shared/presentation/view_models/init_view_model.dart';
import '../models/park_ui_model.dart';
import '../view_models/park_view_model.dart';
import '../view_models/vehicle_view_model.dart';
import 'dotted_line.dart';
import 'park_qr_code.dart';
import 'user_info_tile.dart';

class ParkCard extends ConsumerWidget {
  const ParkCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicleState = ref.watch(vehicleViewModelProvider);
    final parkState = ref.watch(parkViewModelProvider);
    final initState = ref.watch(initViewModelProvider);
    final entryExitTimeLabel = Lang.of(context).entryExitTime;
    final nimLabel = Lang.of(context).nim;
    final plateLabel = Lang.of(context).plate;
    final statusLabel = Lang.of(context).status;

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
                mainAxisExtent: 75.h,
              ),
              children: [
                parkState.when(
                  data:
                      (data) => UserInfoTile(
                        label: entryExitTimeLabel,
                        value: data.parkUiModel?.lastActivityDay ?? "",
                        value2: data.parkUiModel?.lastActivityTime ?? "",
                      ),

                  loading: () => _buildLoadingBox(),
                  error: (e, st) => SizedBox.shrink(),
                ),

                initState.when(
                  data:
                      (data) => UserInfoTile(
                        label: nimLabel,
                        value: data.userUiModel?.studentId ?? "",
                      ),
                  loading: () => _buildLoadingBox(),
                  error: (e, st) => SizedBox.shrink(),
                ),

                vehicleState.when(
                  data:
                      (data) => UserInfoTile(
                        label: plateLabel,
                        value: data.vehicleUiModel?.plate ?? "",
                      ),
                  loading: () => _buildLoadingBox(),
                  error: (e, st) => SizedBox.shrink(),
                ),

                parkState.when(
                  data:
                      (data) => UserInfoTile(
                        label: statusLabel,
                        value:
                            data.parkUiModel?.status.displayName(context) ?? "",
                      ),
                  loading: () => _buildLoadingBox(),
                  error: (e, st) => SizedBox.shrink(),
                ),
              ],
            ),
          ),
          Row(
            children: [
              _buildCardDecoration(context, offsetX: -22.w),
              Expanded(
                child: DottedLine(
                  color: AppColor.containerColorPrimary(context),
                ),
              ),
              _buildCardDecoration(context, offsetX: 22.w),
            ],
          ),
          SizedBox(height: 20.h),
          ParkQrCode(),
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

  Widget _buildLoadingBox() {
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
