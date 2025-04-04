import 'package:flutter/material.dart';

import '../../../../core/utils/lang.dart';
import 'exception.dart';

class CommonExceptionHandler {
  const CommonExceptionHandler._();

  static String of(BuildContext context, CommonException error) {
    final lang = Lang.of(context);
    switch (error.type) {
      case CommonFailureType.networkError:
        return lang.networkError;
      case CommonFailureType.serverError:
        return lang.serverError;
      case CommonFailureType.documentDataIsNull:
        return lang.serverError;
      case CommonFailureType.unknownError:
        return lang.unknownError;
    }
  }
}
