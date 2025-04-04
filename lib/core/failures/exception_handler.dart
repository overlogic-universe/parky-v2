import 'package:flutter/material.dart';

import '../../features/auth/core/failures/auth_exception.dart';
import '../../features/auth/core/failures/auth_exception_handler.dart';
import '../../features/shared/presentation/widgets/custom_toast.dart';
import '../styles/colors/app_color.dart';
import '../utils/lang.dart';
import 'common_exception_handler.dart';
import 'exception.dart';

class ExceptionHandler {
  const ExceptionHandler._();

  // TODO: Handle exception
  static void of(BuildContext context, Object error) {
    String message;
    switch (error) {
      case CommonException _:
        message = CommonExceptionHandler.of(context, error);
        break;
      case AuthException _:
        message = AuthExceptionHandler.of(context, error);
        break;
      default:
        message = Lang.of(context).unknownError;
    }
    CustomToast.showToast(
      context,
      message: message,
      backgroundColor: AppColor.error(context),
    );
  }
}
