import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/common/margin_constant.dart';
import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../../../core/utils/get_logo_asset_util.dart';
import '../../../shared/core/utils/scroll_util.dart';
import '../../../shared/presentation/view_models/init_view_model.dart';
import '../../../shared/presentation/widgets/margin_bottom.dart';
import '../../core/utils/home_util.dart';
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
  Widget build(BuildContext context) {
    final state = ref.watch(initViewModelProvider);
    return SingleChildScrollView(
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
            Text(
              HomeUtil.getHomeGreeting(context),
              style: AppFont.displaySmall(context),
            ),
            state.maybeWhen(
              data:
                  (data) => Text(
                    HomeUtil.getMiddleName(data.student?.name ?? ""),
                    style: AppFont.displayLarge(
                      context,
                    )?.copyWith(color: AppColor.primary(context)),
                  ),
              orElse: () => SizedBox.shrink(),
            ),
            SizedBox(height: 30.h),
            ParkCard(),
            MarginBottom(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppLogo() {
    final logoAsset = GetLogoAssetUtil.of(context);
    return Center(child: Image.asset(logoAsset, height: 35.h));
  }
}
