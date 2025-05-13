import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parky/features/setting/presentation/widgets/authentication_card.dart';

import '../../../../core/constants/common/margin_constant.dart';
import '../../../../core/utils/lang.dart';
import '../../../shared/core/utils/scroll_util.dart';
import '../../../shared/presentation/pages/base_screen_with_decoration.dart';
import '../../../shared/presentation/widgets/app_bar_custom.dart';
import '../../../shared/presentation/widgets/margin_bottom.dart';
import '../widgets/account_card.dart';
import '../widgets/personalized_card.dart';

class SettingTab extends ConsumerStatefulWidget {
  const SettingTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingTabState();
}

class _SettingTabState extends ConsumerState<SettingTab> {
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
    return BaseScreenWithDecoration(
      horizontalPadding: 0,
      appBar: AppBarCustom(
        showBackIcon: false,
        title: Text(Lang.of(context).setting),
      ),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MarginConstant.horizontalScreen,
          ),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              AccountCard(),
              SizedBox(height: 10.h),
              PersonalizedCard(),
              SizedBox(height: 10.h),
              AuthenticationCard(),
              MarginBottom(),
            ],
          ),
        ),
      ),
    );
  }
}
