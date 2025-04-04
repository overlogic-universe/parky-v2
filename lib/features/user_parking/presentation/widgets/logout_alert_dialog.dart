import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/failures/exception_handler.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../../../core/utils/lang.dart';
import '../../../auth/presentation/view_models/login_state.dart';
import '../../../auth/presentation/view_models/login_view_model.dart';
import '../../../shared/presentation/widgets/custom_toast.dart';
import '../../../shared/presentation/widgets/dialog_loader.dart';

class LogoutAlertDialog extends ConsumerWidget {
  const LogoutAlertDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _logOutActionListener(context, ref);
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      content: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Text(
          Lang.of(context).logoutModalDesc,
          style: AppFont.bodyMedium(context),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            Lang.of(context).cancel,
            style: AppFont.bodyMedium(
              context,
            )?.copyWith(color: AppColor.primary(context)),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            ref.read(loginViewModelProvider.notifier).signOut();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.error(context),
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          ),
          child: Text(
            Lang.of(context).logout,
            style: AppFont.labelMedium(
              context,
            )?.copyWith(color: AppColor.onError(context)),
          ),
        ),
      ],
    );
  }

  void _logOutActionListener(BuildContext context, WidgetRef ref) {
    ref.listen<LoginState>(loginViewModelProvider, (previous, next) {
      final loginState = ref.watch(loginViewModelProvider);

      loginState.userUiModel.whenOrNull(
        data: (data) {
          DialogLoader.stopLoading(context);
          CustomToast.showToast(
            context,
            message: Lang.of(context).logoutSuccess,
            backgroundColor: AppColor.success(context),
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteName.login,
            (Route<dynamic> route) => false,
          );
        },
        loading: () => DialogLoader.startLoading(context),
        error: (err, _) {
          ExceptionHandler.of(context, err);
          DialogLoader.stopLoading(context);
        },
      );
    });
  }
}
