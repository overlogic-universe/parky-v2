import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../../../core/utils/lang.dart';
import '../../../shared/presentation/view_models/init_state.dart';
import '../../../shared/presentation/view_models/init_view_model.dart';
import '../../../student_parking/presentation/widgets/student_info_tile.dart';
import '../../domain/entities/park_status.dart';
import '../models/park_status_ui.dart';
import '../view_models/park_state.dart';
import '../view_models/park_view_model.dart';
import '../view_models/vehicle_state.dart';
import '../view_models/vehicle_view_model.dart';
import 'dotted_line.dart';
import 'park_qr_code.dart';

class ParkCard extends ConsumerWidget {
  const ParkCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicleState = ref.watch(vehicleViewModelProvider);
    final parkState = ref.watch(parkViewModelProvider);
    final initState = ref.watch(initViewModelProvider);

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
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: _buildStudentInfoGrid(
              context,
              parkState,
              initState,
              vehicleState,
            ),
          ),
          _buildSeparator(context),
          SizedBox(height: 20.h),
          const ParkQrCode(),
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

  Widget _buildStudentInfoGrid(
    BuildContext context,
    AsyncValue<ParkState> parkState,
    AsyncValue<InitState> initState,
    AsyncValue<VehicleState> vehicleState,
  ) {
    final lang = Lang.of(context);

    return GridView(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
      ),
      children: [
        _buildParkedDateTile(context, parkState),
        _buildInfoTileFromAsyncValue(
          context: context,
          label: lang.nim,
          state: initState,
          getValue: (data) => data.student?.nim,
        ),
        _buildParkedTimeTile(context, parkState),
        _buildInfoTileFromAsyncValue(
          context: context,
          label: lang.parkingLot,
          state: parkState,
          getValue: (data) => data.currentParkingLot?.name,
          valueFontSize: 10,
        ),
        _buildInfoTileFromAsyncValue(
          context: context,
          label: lang.plate,
          state: vehicleState,
          getValue: (data) => data.vehicle?.plate,
        ),
        _buildInfoTileFromAsyncValue(
          context: context,
          label: lang.status,
          state: parkState,
          getValue:
              (data) =>
                  data.currentParkingHistory?.status?.displayName(context),
        ),
      ],
    );
  }

  Widget _buildParkedDateTile(BuildContext context, AsyncValue parkState) {
    final lang = Lang.of(context);
    return parkState.when(
      data:
          (data) => StudentInfoTile(
            label:
                data.currentParkingHistory?.status == ParkStatus.parked
                    ? lang.parkedDate
                    : lang.exitDate,
            value: data.currentParkingHistory?.lastActivityDay,
          ),
      loading: () => StudentInfoTile(label: lang.parkedDate, isLoading: true),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _buildParkedTimeTile(BuildContext context, AsyncValue parkState) {
    final lang = Lang.of(context);
    return parkState.when(
      data:
          (data) => StudentInfoTile(
            label:
                data.currentParkingHistory?.status == ParkStatus.parked
                    ? lang.parkedTime
                    : lang.exitTime,
            value: data.currentParkingHistory?.lastActivityTime,
          ),
      loading: () => StudentInfoTile(label: lang.parkedTime, isLoading: true),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _buildInfoTileFromAsyncValue<T>({
    required BuildContext context,
    required String label,
    required AsyncValue<T> state,
    required String? Function(T data) getValue,
    double? valueFontSize,
  }) {
    return state.when(
      data:
          (data) => StudentInfoTile(
            label: label,
            value: getValue(data),
            valueFontSize: valueFontSize,
          ),
      loading: () => StudentInfoTile(label: label, isLoading: true),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _buildSeparator(BuildContext context) {
    return Row(
      children: [
        _buildCircleDecoration(context, offsetX: -22.w),
        Expanded(
          child: DottedLine(color: AppColor.containerColorPrimary(context)),
        ),
        _buildCircleDecoration(context, offsetX: 22.w),
      ],
    );
  }

  Widget _buildCircleDecoration(
    BuildContext context, {
    required double offsetX,
  }) {
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
