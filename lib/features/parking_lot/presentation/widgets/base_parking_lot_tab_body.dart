import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/assets/icon_asset_constant.dart';
import '../../../../core/constants/common/margin_constant.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../../../core/utils/lang.dart';
import '../../../shared/presentation/widgets/svg_asset.dart';
import '../../domain/entities/parking_lot_schedule_entity.dart';

class BaseParkingLotTabBody extends ConsumerWidget {
  final List<ParkingLotScheduleEntity> parkingLotScheduleList;
  const BaseParkingLotTabBody({
    super.key,
    required this.parkingLotScheduleList,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      itemCount: parkingLotScheduleList.length,
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      itemBuilder: (context, index) => _buildCard(context, ref, index),
    );
  }

  Widget _buildCard(BuildContext context, WidgetRef ref, int index) {
    final item = parkingLotScheduleList[index];
    final parkingLot = item.parkingLot;
    final parkingSchedule = item.parkingSchedule;
    final marginHorizontal = MarginConstant.horizontalScreen.w;
    final isLastIndex = index == parkingLotScheduleList.length - 1;
    final isFirstIndex = index == 0;
    final vehicleInCount = parkingLot.vehicleInCount;
    final maxCapacity = parkingLot.maxCapacity;
    final isFull = vehicleInCount >= maxCapacity;
    final unavailableLocation =
        parkingLot.latitude == null || parkingLot.longitude == null;

    return Container(
      margin: EdgeInsets.only(
        left: marginHorizontal,
        right: marginHorizontal,
        top: isFirstIndex ? 20.h : 0,
        bottom: isLastIndex ? MarginConstant.marginBottom.h : 0,
      ),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.r),
      decoration: BoxDecoration(
        color: AppColor.backgroundApp(context),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColor.outlineGrey(context), width: 0.5.w),
      ),
      child: Column(
        spacing: 5.h,
        children: [
          Row(
            spacing: 10.w,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      parkingLot.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppFont.titleMedium(context),
                    ),
                    SizedBox(height: 10.h),
                    _buildParkingLotDetailInfo(
                      context,
                      icon: IconAssetConstant.clock,
                      description:
                          "${parkingSchedule.openTime} - ${parkingSchedule.closedTime} WIB",
                    ),
                    SizedBox(height: 5.h),
                    _buildParkingLotDetailInfo(
                      context,
                      icon: IconAssetConstant.vehicleInCount,
                      description:
                          "${parkingLot.vehicleInCount}/${parkingLot.maxCapacity}",
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
              isFull
                  ? Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 12.w,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.containerColorError(context),
                      border: Border.all(
                        width: 0.3.w,
                        color: AppColor.error(context),
                      ),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Center(
                      child: Text(
                        Lang.of(context).full,
                        style: AppFont.labelSmall(
                          context,
                        )?.copyWith(color: AppColor.error(context)),
                      ),
                    ),
                  )
                  : SizedBox.shrink(),
            ],
          ),
          if (!unavailableLocation) ...[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
              ),
              onPressed:
                  () => Navigator.pushNamed(
                    context,
                    RouteName.parkingLotMap,
                    arguments: parkingLot,
                  ),
              child: Center(
                child: Text(
                  Lang.of(context).viewLocation,
                  style: AppFont.labelSmall(
                    context,
                  )?.copyWith(color: AppColor.onPrimary(context)),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Row _buildParkingLotDetailInfo(
    BuildContext context, {
    required String icon,
    required String description,
  }) {
    return Row(
      spacing: 10.w,
      children: [
        SvgAsset(asset: icon, color: AppColor.primary(context), size: 20),
        Text(
          description,
          style: AppFont.labelMedium(
            context,
          )?.copyWith(color: AppColor.disableTextOrIcon(context)),
        ),
      ],
    );
  }
}
