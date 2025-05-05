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
      case AuthFailureType.userNotFound:
        return AuthExceptionMessageConstant.userNotFound;
      case AuthFailureType.invalidCredentials:
        return AuthExceptionMessageConstant.invalidCredentials;
      case AuthFailureType.passwordIsNull:
        return AuthExceptionMessageConstant.passwordIsNull;
      case AuthFailureType.loginWithGoogleAbortedByUser:
        return AuthExceptionMessageConstant.loginWithGoogleAbortedByUser;
      case AuthFailureType.loginWithGoogleFailed:
        return AuthExceptionMessageConstant.loginWithGoogleFailed;
      case AuthFailureType.invalidEmailDomain:
        return AuthExceptionMessageConstant.invalidEmailDomain;
      case AuthFailureType.signOutFailed:
        return AuthExceptionMessageConstant.signOutFailed;
      case AuthFailureType.loginFailed:
        return AuthExceptionMessageConstant.loginFailed;
    }
  }
}
