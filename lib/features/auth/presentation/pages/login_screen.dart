import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/assets/image_asset_constant.dart';
import '../../../../core/constants/common/margin_constant.dart';
import '../../../../core/failures/exception_handler.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../../../core/utils/lang.dart';
import '../../../shared/presentation/pages/base_screen.dart';
import '../../../shared/presentation/widgets/custom_toast.dart';
import '../../../shared/presentation/widgets/dialog_loader.dart';
import '../../../shared/presentation/widgets/line.dart';
import '../../../shared/presentation/widgets/margin_bottom.dart';
import '../view_models/login_state.dart';
import '../view_models/login_view_model.dart';
import '../widgets/login_form.dart';
import '../widgets/login_with_student_email_button.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _loginActionListener(context, ref);

    return BaseScreen(
      resizeToAvoidBottomInset: true,
      horizontalPadding: 0,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(ImageAssetConstant.loginDecoration, width: 1.sw),
            SizedBox(height: 5.h),
            Text(
              Lang.of(context).loginGreetingTitle,
              style: AppFont.displaySmall(context),
            ),
            SizedBox(height: 5.h),
            Text(
              Lang.of(context).loginGreetingDesc,
              style: AppFont.labelSmall(
                context,
              )?.copyWith(color: AppColor.disableTextOrIcon(context)),
            ),
            SizedBox(height: 30.h),
            LoginForm(),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MarginConstant.leadingMarginLeft.w,
              ),
              child: Row(
                children: [
                  Expanded(child: Line()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text(
                      Lang.of(context).or,
                      style: AppFont.labelMedium(
                        context,
                      )?.copyWith(color: AppColor.disableTextOrIcon(context)),
                    ),
                  ),
                  Expanded(child: Line()),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            LoginWithStudentEmailButton(),
            MarginBottom(),
          ],
        ),
      ),
    );
  }

  void _loginActionListener(BuildContext context, WidgetRef ref) {
    ref.listen<LoginState>(loginViewModelProvider, (previous, next) {
      final loginState = ref.watch(loginViewModelProvider);

      loginState.student.whenOrNull(
        data: (data) {
          DialogLoader.stopLoading(context);
          CustomToast.showToast(
            context,
            message: Lang.of(context).loginSuccess,
            backgroundColor: AppColor.success(context),
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteName.main,
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
