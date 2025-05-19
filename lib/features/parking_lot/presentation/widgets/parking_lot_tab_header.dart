import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/app_color.dart';

class ParkingLotTabHeader extends StatelessWidget {
  const ParkingLotTabHeader({super.key, required TabController tabController, required List<Widget> tabs})
    : _tabController = tabController,
    _tabs = tabs;

  final TabController _tabController;
  final List<Widget> _tabs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.backgroundApp(context),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Material(
        child: TabBar(
          overlayColor: WidgetStatePropertyAll(AppColor.primaryDarker(context)),
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.label,
          dividerHeight: 0.4.w,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              width: 1.5.w,
              color: AppColor.primary(context),
            ),
          ),
          labelColor: AppColor.primary(context),
          unselectedLabelColor: AppColor.backgroundApp(context),
          tabs: _tabs,
        ),
      ),
    );
  }
}
