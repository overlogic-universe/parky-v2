import 'package:flutter/material.dart';

import '../../../../core/utils/lang.dart';
import 'auth_exception.dart';
import 'auth_failure_type.dart';

class AuthExceptionHandler {
  const AuthExceptionHandler._();

  static String of(BuildContext context, AuthException error) {
    final lang = Lang.of(context);
    switch (error.type) {
      case AuthFailureType.studentNotFound:
        return lang.studentNotFound;
      case AuthFailureType.invalidCredentials:
        return lang.invalidCredentials;
      case AuthFailureType.passwordIsNull:
        return lang.passwordIsNull;
      case AuthFailureType.loginWithGoogleAbortedByStudent:
        return lang.loginWithGoogleAbortedByStudent;
      case AuthFailureType.loginWithGoogleFailed:
        return lang.loginWithGoogleFailed;
      case AuthFailureType.invalidEmailDomain:
        return lang.mustUseStudentEmail;
      case AuthFailureType.signOutFailed:
        return lang.signOutFailed;
      case AuthFailureType.loginFailed:
        return lang.loginFailed;
      case AuthFailureType.updatePasswordFailed:
        return lang.updatePasswordFailed;
      case AuthFailureType.passwordUnchanged:
        return lang.passwordUnchanged;
      case AuthFailureType.requiresRecentLogin:
        return lang.requiresRecentLogin;
      case AuthFailureType.wrongOldPassword:
        return lang.wrongOldPassword;
    }
  }
}
