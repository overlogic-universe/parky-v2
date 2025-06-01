import '../constants/failures/auth_exception_message_constant.dart';
import 'auth_failure_type.dart';

class AuthException implements Exception {
  final String message;
  final AuthFailureType type;

  const AuthException._internal({required this.message, required this.type});

  factory AuthException({required AuthFailureType type, String? message}) {
    final resolvedMessage = message ?? _mapTypeToMessage(type);
    return AuthException._internal(message: resolvedMessage, type: type);
  }

  static String _mapTypeToMessage(AuthFailureType type) {
    switch (type) {
      case AuthFailureType.studentNotFound:
        return AuthExceptionMessageConstant.studentNotFound;
      case AuthFailureType.invalidCredentials:
        return AuthExceptionMessageConstant.invalidCredentials;
      case AuthFailureType.passwordIsNull:
        return AuthExceptionMessageConstant.passwordIsNull;
      case AuthFailureType.loginWithGoogleAbortedByStudent:
        return AuthExceptionMessageConstant.loginWithGoogleAbortedByStudent;
      case AuthFailureType.loginWithGoogleFailed:
        return AuthExceptionMessageConstant.loginWithGoogleFailed;
      case AuthFailureType.invalidEmailDomain:
        return AuthExceptionMessageConstant.invalidEmailDomain;
      case AuthFailureType.signOutFailed:
        return AuthExceptionMessageConstant.signOutFailed;
      case AuthFailureType.loginFailed:
        return AuthExceptionMessageConstant.loginFailed;
      case AuthFailureType.updatePasswordFailed:
        return AuthExceptionMessageConstant.updatePasswordFailed;
      case AuthFailureType.passwordUnchanged:
        return AuthExceptionMessageConstant.passwordUnchanged;
      case AuthFailureType.requiresRecentLogin:
        return AuthExceptionMessageConstant.requiresRecentLogin;
      case AuthFailureType.wrongOldPassword:
        return AuthExceptionMessageConstant.wrongOldPassword;
    }
  }
}
