import '../constant/failures/user_parking_exception_message_constant.dart';
import 'user_parking_failure_type.dart';

class UserParkingException implements Exception {
  final String message;
  final UserParkingFailureType type;

  const UserParkingException._internal({
    required this.message,
    required this.type,
  });

  factory UserParkingException({
    required UserParkingFailureType type,
    String? message,
    String? userId,
  }) {
    final resolvedMessage = message ?? _mapTypeToMessage(userId, type);
    return UserParkingException._internal(message: resolvedMessage, type: type);
  }

  static String _mapTypeToMessage(String? userId, UserParkingFailureType type) {
    switch (type) {
      case UserParkingFailureType.parkNotFound:
        return UserParkingExceptionMessageConstant.parkNotFound(userId ?? "-");
      case UserParkingFailureType.vehicleNotFound:
        return UserParkingExceptionMessageConstant.vehicleNotFound(userId ?? "-");
    }
  }
}
