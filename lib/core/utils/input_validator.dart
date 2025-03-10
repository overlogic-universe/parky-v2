import 'package:flutter/material.dart';
import 'lang.dart';

class InputValidator {
  const InputValidator._();

  static String? emptyField(BuildContext context, String? value, String field) {
    if (value == null || value.isEmpty) {
      return Lang.of(context).mustNotBeEmpty(field);
    }
    return null;
  }

  static String? fieldRequired(
      BuildContext context, String? value, String field, int length) {
    if (value == null || value.isEmpty) {
      return Lang.of(context).mustNotBeEmpty(field);
    } else if (value.length <= length) {
      return Lang.of(context).atLeastLengthCharacters(field, length);
    }
    return null;
  }

}
