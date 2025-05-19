import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants/common/margin_constant.dart';
import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../../../core/utils/lang.dart';
import '../../../shared/presentation/pages/base_screen_with_decoration.dart';
import '../../../shared/presentation/widgets/app_bar_custom.dart';
import '../../../shared/presentation/widgets/no_data_text.dart';
import '../../domain/entities/parking_schedule_day_type.dart';
import '../models/week_day_ui.dart';
import '../view_models/parking_lot_state.dart';
import '../view_models/parking_lot_view_model.dart';
import '../widgets/base_parking_lot_tab_body.dart';

class ParkingLotTab extends ConsumerStatefulWidget {
  const ParkingLotTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ParkingLotTabState();
}

class _ParkingLotTabState extends ConsumerState<ParkingLotTab>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: WeekDay.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(parkingLotViewModelProvider);

    return BaseScreenWithDecoration(
      horizontalPadding: 0,
      appBar: AppBarCustom(
        showBackIcon: false,
        title: Text(Lang.of(context).parkingInfo),
      ),
      child: Column(
        children: [
          Container(
            height: 45.h,
            decoration: BoxDecoration(
              color: AppColor.backgroundApp(context),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Material(
              color: AppColor.backgroundApp(context),
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 8.w),
                tabAlignment: TabAlignment.start,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs:
                    WeekDay.values
                        .map(
                          (day) => Tab(
                            child: Text(
                              day.displayName(context),
                              style: AppFont.bodyMedium(context)?.regular,
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children:
                  WeekDay.values.map<Widget>((day) {
                    return state.when(
                      data: (data) => _buildSuccess(context, data, day),
                      loading: () => _buildLoading(context),
                      error: (error, stackTrace) => NoDataText(),
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccess(
    BuildContext context,
    ParkingLotState data,
    WeekDay day,
  ) {
    final scheduleList = data.parkingLotScheduleMap[day] ?? [];
    if (scheduleList.isEmpty) return NoDataText();
    return BaseParkingLotTabBody(parkingLotScheduleList: scheduleList);
  }

  Column _buildLoading(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => SizedBox(height: 10.h),
          itemCount: 2,
          itemBuilder:
              (context, index) => Shimmer.fromColors(
                baseColor: AppColor.baseShimmerColor(context),
                highlightColor: AppColor.highlightShimmerColor(context),
                child: Container(
                  height: 100.h,
                  width: 1.sw,
                  margin: EdgeInsets.symmetric(
                    horizontal: MarginConstant.horizontalScreen.w,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.outlineGrey(context),
                      width: 0.5.w,
                    ),
                    color: AppColor.backgroundApp(context),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ),
        ),
      ],
    );
  }
}
