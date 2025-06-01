class AuthExceptionMessageConstant {
  const AuthExceptionMessageConstant._();

  static const String studentNotFound = "Student not found.";
  static const String passwordIsNull = "password is null.";
  static const String emailAlreadyRegistered = "email already registered.";
  static const String loginWithGoogleAbortedByStudent =
      "Google sign-in aborted by Student.";
  static const String loginWithGoogleFailed = "Google sign-in failed.";
  static const String invalidCredentials = "Email or password is incorrect.";
  static const String wrongOldPassword = "Old password is incorrect.";
  static const String emailAlreadyExists = "This email is already in use.";
  static const String invalidEmailDomain =
      "Email domain has to end with @student.ums.ac.id";
  static const String signOutFailed = "Sign out is failed.";
  static const String loginFailed = "Login is failed.";
  static const String updatePasswordFailed = "Update Password is failed.";
  static const String passwordUnchanged =
      "New password must be different from the old password.";
  static const String requiresRecentLogin =
      "Requires recent authentication. Log in again before retrying this request.";
}
