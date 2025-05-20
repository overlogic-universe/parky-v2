import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parky/features/shared/presentation/view_models/init_view_model.dart';
import 'package:parky/features/student_parking/presentation/view_models/park_view_model.dart';
import 'package:parky/features/student_parking/presentation/view_models/vehicle_view_model.dart';

import '../../../../core/constants/common/margin_constant.dart';
import '../../../../core/utils/get_logo_asset_util.dart';
import '../../../shared/core/utils/scroll_util.dart';
import '../../../shared/presentation/widgets/margin_bottom.dart';
import 'home_greetings.dart';
import 'park_card.dart';

class HomeContent extends ConsumerStatefulWidget {
  const HomeContent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeContentState();
}

class _HomeContentState extends ConsumerState<HomeContent> {
  late final ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    Future.microtask(
      () => ScrollUtil.attachBottomNavbarVisibilityListener(
        controller: _scrollController,
        ref: ref,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Future<void> _onRefresh() async {
    await ref.read(initViewModelProvider.notifier).getStudentEntity();
    await ref.read(parkViewModelProvider.notifier).refresh();
    await ref.read(vehicleViewModelProvider.notifier).refresh();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _onRefresh(),
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MarginConstant.horizontalScreen.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(child: SizedBox(height: 10.h)),
              _buildAppLogo(),
              SizedBox(height: 40.h),
              HomeGreetings(),
              SizedBox(height: 30.h),
              ParkCard(),
              MarginBottom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppLogo() {
    final logoAsset = GetLogoAssetUtil.of(context);
    return Center(child: Image.asset(logoAsset, height: 35.h));
  }
}
