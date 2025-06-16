import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/assets/icon_asset_constant.dart';
import '../../../../core/constants/common/margin_constant.dart';
import '../../../../core/constants/styles/style_constant.dart';
import '../../../../core/utils/input_validator.dart';
import '../../../../core/utils/lang.dart';
import '../../../shared/presentation/widgets/text_field_icon.dart';
import '../../core/utils/auth_input_validator.dart';
import '../../domain/entities/login_with_email_password_request.dart';
import '../view_models/login_view_model.dart';

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
              validator:
                  (value) =>
                      AuthInputValidator.validateStudentEmail(context, value),
              style: StyleConstant.inputStyle(context),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: TextFieldIcon(icon: IconAssetConstant.email),
                hintText:  Lang.of(context).enterYour(Lang.of(context).email),
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
                prefixIcon: TextFieldIcon(icon: IconAssetConstant.password),
                suffixIcon: GestureDetector(
                  onTap: () => _togglePassword(),
                  child:
                      isPassVisible
                          ? TextFieldIcon(icon: IconAssetConstant.visiblePass)
                          : TextFieldIcon(
                            icon: IconAssetConstant.invisiblePass,
                          ),
                ),
                hintText: Lang.of(context).enterYour(Lang.of(context).password),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     RememberMe(),
            //     Text(
            //       Lang.of(context).forgotYourPassword,
            //       style: AppFont.labelMedium(
            //         context,
            //       )?.copyWith(color: AppColor.primary(context)),
            //     ),
            //   ],
            // ),
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
}
