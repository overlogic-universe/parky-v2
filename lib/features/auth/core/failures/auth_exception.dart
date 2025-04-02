class AuthException implements Exception {
  final String message;
  final AuthFailureType type;

  AuthException({required this.message, required this.type});
}

enum AuthFailureType {
  userNotFound,
  invalidCredentials,
  passwordIsNull,
  loginWithGoogleAbortedByUser,
  loginWithGoogleFailed,
  invalidEmailDomain,
  signOutFailed,
  loginFailed,
}
