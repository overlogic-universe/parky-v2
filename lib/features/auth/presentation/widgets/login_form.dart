import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parky/core/routes/route_name.dart';

import '../../../../core/constants/assets/icon_asset_constant.dart';
import '../../../../core/constants/common/margin_constant.dart';
import '../../../../core/constants/styles/style_constant.dart';
import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../../../core/utils/lang.dart';
import '../../../shared/presentation/widgets/svg_asset.dart';
import 'remember_me.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  late final TextEditingController _emailController;
  late final TextEditingController _passController;
  late final GlobalKey<FormState> _formKey;

  bool isPassVisible = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
  }

  void _togglePassword() => setState(() => isPassVisible = !isPassVisible);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MarginConstant.horizontalScreen.w,
        ),
        child: Column(
          spacing: 15.h,
          children: [
            TextFormField(
              controller: _emailController,
              style: StyleConstant.inputStyle(context),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: _buildIcon(IconAssetConstant.email),
                hintText: Lang.of(context).enterYourEmail,
              ),
            ),
            TextFormField(
              controller: _passController,
              style: StyleConstant.inputStyle(context),
              keyboardType: TextInputType.visiblePassword,
              obscureText: !isPassVisible,
              decoration: InputDecoration(
                prefixIcon: _buildIcon(IconAssetConstant.password),
                suffixIcon: GestureDetector(
                  onTap: () => _togglePassword(),
                  child:
                      isPassVisible
                          ? _buildIcon(IconAssetConstant.visiblePass)
                          : _buildIcon(IconAssetConstant.invisiblePass),
                ),
                hintText: Lang.of(context).enterYourPassword,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RememberMe(),
                Text(
                  Lang.of(context).forgotYourPassword,
                  style: AppFont.labelMedium(
                    context,
                  )?.copyWith(color: AppColor.primary(context)),
                ),
              ],
            ),
            SizedBox.shrink(),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, RouteName.home),
              child: Center(child: Text(Lang.of(context).login)),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildIcon(String icon) {
    return Padding(
      padding: EdgeInsets.all(13.r),
      child: SvgAsset(asset: icon),
    );
  }
}
