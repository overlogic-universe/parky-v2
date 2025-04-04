import 'package:flutter/material.dart';

import '../../../../core/utils/lang.dart';
import 'auth_exception.dart';

class AuthExceptionHandler {
  const AuthExceptionHandler._();

  static String of(BuildContext context, AuthException error) {
    final lang = Lang.of(context);
    switch (error.type) {
      case AuthFailureType.userNotFound:
        return lang.userNotFound;
      case AuthFailureType.invalidCredentials:
        return lang.invalidCredentials;
      case AuthFailureType.passwordIsNull:
        return lang.passwordIsNull;
      case AuthFailureType.loginWithGoogleAbortedByUser:
        return lang.loginWithGoogleAbortedByUser;
      case AuthFailureType.loginWithGoogleFailed:
        return lang.loginWithGoogleFailed;
      case AuthFailureType.invalidEmailDomain:
        return lang.mustUseStudentEmail;
      case AuthFailureType.signOutFailed:
        return lang.signOutFailed;
      case AuthFailureType.loginFailed:
        return lang.loginFailed;
    }
  }
}
