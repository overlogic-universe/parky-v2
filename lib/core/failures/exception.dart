import '../constants/failures/common_exception_message_constant.dart';
import 'common_failure_type.dart';

class CommonException implements Exception {
  final String message;
  final CommonFailureType type;

  const CommonException._internal({required this.message, required this.type});

  factory CommonException({required CommonFailureType type, String? message}) {
    final resolvedMessage = message ?? _mapTypeToMessage(type);
    return CommonException._internal(message: resolvedMessage, type: type);
  }

  static String _mapTypeToMessage(CommonFailureType type) {
    switch (type) {
      case CommonFailureType.serverError:
        return CommonExceptionMessageConstant.serverError;
      case CommonFailureType.networkError:
        return CommonExceptionMessageConstant.networkError;
      case CommonFailureType.documentDataIsNull:
        return CommonExceptionMessageConstant.documentDataIsNull;
      case CommonFailureType.unknownError:
        return CommonExceptionMessageConstant.unknownError;
    }
  }
}
