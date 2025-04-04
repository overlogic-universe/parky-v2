import 'package:flutter/material.dart';
import '../../../../core/utils/lang.dart';

class AuthInputValidator {
  const AuthInputValidator._();

  static String? validateStudentEmail(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return Lang.of(context).mustNotBeEmpty(Lang.of(context).email);
    }

    if (!value.endsWith('@student.ums.ac.id')) {
      return Lang.of(context).mustUseStudentEmail;
    }
    return null;
  }
}
