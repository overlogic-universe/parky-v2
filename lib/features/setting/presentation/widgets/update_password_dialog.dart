import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/assets/icon_asset_constant.dart';
import '../../../../core/constants/styles/style_constant.dart';
import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../../../core/utils/input_validator.dart';
import '../../../../core/utils/lang.dart';
import '../../../shared/presentation/widgets/custom_toast.dart';
import '../../../shared/presentation/widgets/text_field_icon.dart';
import '../view_models/setting_view_model.dart';

class UpdatePasswordDialog extends ConsumerStatefulWidget {
  const UpdatePasswordDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpdatePasswordDialogState();
}

class _UpdatePasswordDialogState extends ConsumerState<UpdatePasswordDialog> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _edtOldPassword;
  late final TextEditingController _edtNewPassword;

  bool _isOldPassVisible = false;
  bool _isNewPassVisible = false;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _edtOldPassword = TextEditingController();
    _edtNewPassword = TextEditingController();
  }

  @override
  void dispose() {
    _edtOldPassword.dispose();
    _edtNewPassword.dispose();
    super.dispose();
  }

  void _toggleOldPassword() =>
      setState(() => _isOldPassVisible = !_isOldPassVisible);
  void _toggleNewPassword() =>
      setState(() => _isNewPassVisible = !_isNewPassVisible);

  void _handleUpdatePassword() async {
    if (_formKey.currentState!.validate()) {
      final newPassword = _edtNewPassword.text.trim();
      final oldPassword = _edtOldPassword.text.trim();
      if (newPassword == oldPassword) {
        CustomToast.showToast(
          context,
          message: Lang.of(context).passwordUnchanged,
        );
        return;
      }

      await ref
          .read(settingViewModelProvider.notifier)
          .updatePassword(oldPassword: oldPassword, newPassword: newPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Lang.of(context).updatePassword,
              style: AppFont.titleMedium(context),
            ),
            SizedBox(height: 5.h),

            Text(
              Lang.of(context).updatePasswordDesc,
              style: AppFont.labelSmall(
                context,
              )?.copyWith(color: AppColor.disableTextOrIcon(context)),
            ),
            SizedBox(height: 20.h),
            _buildPasswordField(
              controller: _edtOldPassword,
              isVisible: _isOldPassVisible,
              onToggleVisibility: () => _toggleOldPassword(),
              field: Lang.of(context).oldPassword,
            ),
            SizedBox(height: 10.h),
            _buildPasswordField(
              controller: _edtNewPassword,
              isVisible: _isNewPassVisible,
              onToggleVisibility: () => _toggleNewPassword(),
              field: Lang.of(context).newPassword,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            Lang.of(context).cancel,
            style: AppFont.bodyMedium(
              context,
            )?.copyWith(color: AppColor.error(context)),
          ),
        ),
        ElevatedButton(
          onPressed: () async => _handleUpdatePassword(),
          child: Text(Lang.of(context).update),
        ),
      ],
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required bool isVisible,
    required VoidCallback onToggleVisibility,
    required String field,
  }) {
    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide.none,
    );
    return TextFormField(
      controller: controller,
      obscureText: !isVisible,
      validator:
          (value) => InputValidator.fieldRequired(
            context,
            value: value,
            field: field,
            length: 6,
          ),
      style: StyleConstant.inputStyle(context),
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        focusedErrorBorder: outlineInputBorder,
        errorBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        suffixIcon: GestureDetector(
          onTap: onToggleVisibility,
          child: TextFieldIcon(
            icon:
                isVisible
                    ? IconAssetConstant.visiblePass
                    : IconAssetConstant.invisiblePass,
          ),
        ),
        hintText: field,
      ),
    );
  }
}
