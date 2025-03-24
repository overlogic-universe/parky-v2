import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/assets/image_asset_constant.dart';
import '../../../../core/constants/common/margin_constant.dart';
import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../../../core/utils/lang.dart';
import '../../../common/screens/base_screen.dart';
import '../../../common/widgets/line.dart';
import '../../../common/widgets/margin_bottom.dart';
import '../widgets/login_form.dart';
import '../widgets/login_with_student_email_button.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
}
