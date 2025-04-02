class CommonException implements Exception {
  final String message;
  final CommonFailureType type;

  CommonException({required this.message, required this.type});
}

enum CommonFailureType {
  serverError,
  networkError,
  unknownError,
  documentDataIsNull,
}
