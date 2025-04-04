import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parky/features/shared/presentation/widgets/custom_toast.dart';

import '../../../../core/constants/assets/icon_asset_constant.dart';
import '../../../../core/constants/common/margin_constant.dart';
import '../../../../core/constants/styles/style_constant.dart';
import '../../../../core/failures/exception_handler.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../../../core/utils/input_validator.dart';
import '../../../../core/utils/lang.dart';
import '../../../shared/presentation/widgets/dialog_loader.dart';
import '../../../shared/presentation/widgets/svg_asset.dart';
import '../../core/utils/auth_input_validator.dart';
import '../../domain/entities/login_with_email_password_request.dart';
import '../view_models/login_state.dart';
import '../view_models/login_view_model.dart';
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

  void _handleLoginButton() {
    if (_formKey.currentState!.validate()) {
      ref
          .read(loginViewModelProvider.notifier)
          .loginWithEmailAndPassword(
            loginWithEmailPasswordRequest: LoginWithEmailPasswordRequest(
              email: _emailController.text.trim(),
              password: _passController.text.trim(),
            ),
          );
    }
  }

  void _loginActionListener() {
    ref.listen<LoginState>(loginViewModelProvider, (previous, next) {
      final context = this.context;

      final loginState = ref.watch(loginViewModelProvider);

      loginState.userUiModel.whenOrNull(
        data: (data) {
          DialogLoader.stopLoading(context);
          CustomToast.showToast(
            context,
            message: Lang.of(context).loginSuccess,
            backgroundColor: AppColor.success(context),
          );
          Navigator.pushReplacementNamed(context, RouteName.home);
        },
        loading: () => DialogLoader.startLoading(context),
        error: (err, _) {
          ExceptionHandler.of(context, err);
          DialogLoader.stopLoading(context);
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    _loginActionListener();

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
              validator:
                  (value) =>
                      AuthInputValidator.validateStudentEmail(context, value),
              style: StyleConstant.inputStyle(context),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: _buildIcon(IconAssetConstant.email),
                hintText: Lang.of(context).enterYourEmail,
              ),
            ),
            TextFormField(
              controller: _passController,
              validator:
                  (value) => InputValidator.fieldRequired(
                    context,
                    value: value,
                    field: Lang.of(context).password,
                    length: 6,
                  ),
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
              onPressed: () => _handleLoginButton(),
              child: Center(child: Text(Lang.of(context).login)),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildIcon(String icon) {
    return Padding(padding: EdgeInsets.all(13.r), child: SvgAsset(asset: icon));
  }
}
