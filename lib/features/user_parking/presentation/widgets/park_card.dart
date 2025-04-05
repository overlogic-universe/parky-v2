import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../../../core/utils/lang.dart';
import '../../../shared/presentation/view_models/init_view_model.dart';
import '../models/park_ui_model.dart';
import '../view_models/park_view_model.dart';
import '../view_models/vehicle_view_model.dart';
import 'async_user_info_tile.dart';
import 'dotted_line.dart';

class ParkCard extends ConsumerStatefulWidget {
  const ParkCard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ParkCardState();
}

class _ParkCardState extends ConsumerState<ParkCard> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => _initialize());
  }

  void _initialize() {
    final state = ref.read(initViewModelProvider);
    final alreadyHasUser = state.whenOrNull(
      data: (d) => d.userUiModel.whenOrNull(data: (u) => u != null),
    );

    if (alreadyHasUser != true) {
      ref.read(initViewModelProvider.notifier).getUserEntity();
    }

    ref.read(parkViewModelProvider.notifier).fetch();
    ref.read(vehicleViewModelProvider.notifier).fetch();
  }

  @override
  Widget build(BuildContext context) {
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
                mainAxisExtent: 80.h,
              ),
              children: [
                AsyncUserInfoTile(
                  label: entryExitTimeLabel,
                  value: parkState.when(
                    data:
                        (data) =>
                            AsyncData(data.parkUiModel?.lastActivityDay ?? ""),
                    loading: () => const AsyncLoading(),
                    error: (e, st) => AsyncError(e, st),
                  ),
                  value2: parkState.when(
                    data:
                        (data) =>
                            AsyncData(data.parkUiModel?.lastActivityTime ?? ""),
                    loading: () => const AsyncLoading(),
                    error: (e, st) => AsyncError(e, st),
                  ),
                ),
                AsyncUserInfoTile(
                  label: nimLabel,
                  value: initState.when(
                    data:
                        (data) => data.userUiModel.when(
                          data: (u) => AsyncData(u?.studentId ?? ""),
                          loading: () => const AsyncLoading(),
                          error: (e, st) => AsyncError(e, st),
                        ),
                    loading: () => const AsyncLoading(),
                    error: (e, st) => AsyncError(e, st),
                  ),
                ),
                AsyncUserInfoTile(
                  label: plateLabel,
                  value: vehicleState.when(
                    data: (data) => AsyncData(data.vehicleUiModel?.plate ?? ""),
                    loading: () => const AsyncLoading(),
                    error: (e, st) => AsyncError(e, st),
                  ),
                ),
                AsyncUserInfoTile(
                  label: statusLabel,
                  value: parkState.when(
                    data:
                        (data) => AsyncData(
                          data.parkUiModel?.status.displayName(context) ?? "",
                        ),
                    loading: () => const AsyncLoading(),
                    error: (e, st) => AsyncError(e, st),
                  ),
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
          Container(
            height: 200.w,
            width: 200.w,
            decoration: BoxDecoration(
              color: AppColor.containerColorPrimary(context),
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
