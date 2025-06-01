import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/common/margin_constant.dart';
import '../../../../core/failures/exception_handler.dart';
import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/utils/lang.dart';
import '../../../shared/core/utils/scroll_util.dart';
import '../../../shared/presentation/pages/base_screen_with_decoration.dart';
import '../../../shared/presentation/widgets/app_bar_custom.dart';
import '../../../shared/presentation/widgets/custom_toast.dart';
import '../../../shared/presentation/widgets/dialog_loader.dart';
import '../../../shared/presentation/widgets/margin_bottom.dart';
import '../view_models/setting_view_model.dart';
import '../widgets/account_card.dart';
import '../widgets/authentication_card.dart';
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
    ref.listen(settingViewModelProvider, (previous, next) {
      next.when(
        data: (data) {
          DialogLoader.stopLoading(context);
          final prevData = previous?.valueOrNull;
          if (prevData != null) {
            if (prevData.themeModeType != data.themeModeType) {
              CustomToast.showToast(
                context,
                message: Lang.of(context).successChangeTheme,
                backgroundColor: AppColor.success(context),
                position: ToastPosition.top,
              );
            } else if (prevData.localeId != data.localeId) {
              CustomToast.showToast(
                context,
                message: Lang.of(context).successChangeLanguage,
                backgroundColor: AppColor.success(context),
                position: ToastPosition.top,
              );
            } else {
              CustomToast.showToast(
                context,
                message: Lang.of(context).successUpdatePassword,
                backgroundColor: AppColor.success(context),
                position: ToastPosition.top,
              );
              Navigator.pop(context);
            }
          }
        },
        error: (error, _) {
          DialogLoader.stopLoading(context);
          ExceptionHandler.of(context, error);
        },
        loading: () => DialogLoader.startLoading(context),
      );
    });

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
