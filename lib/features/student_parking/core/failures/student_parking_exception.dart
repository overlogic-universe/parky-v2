import '../../../student_parking/core/constant/failures/student_parking_exception_message_constant.dart';
import '../../../student_parking/core/failures/student_parking_failure_type.dart';

class StudentParkingException implements Exception {
  final String message;
  final StudentParkingFailureType type;

  const StudentParkingException._internal({
    required this.message,
    required this.type,
  });

  factory StudentParkingException({
    required StudentParkingFailureType type,
    String? message,
    String? studentId,
  }) {
    final resolvedMessage = message ?? _mapTypeToMessage(studentId, type);
    return StudentParkingException._internal(
      message: resolvedMessage,
      type: type,
    );
  }

  static String _mapTypeToMessage(
    String? studentId,
    StudentParkingFailureType type,
  ) {
    switch (type) {
      case StudentParkingFailureType.parkNotFound:
        return StudentParkingExceptionMessageConstant.parkNotFound(
          studentId ?? "-",
        );
      case StudentParkingFailureType.vehicleNotFound:
        return StudentParkingExceptionMessageConstant.vehicleNotFound(
          studentId ?? "-",
        );
      case StudentParkingFailureType.paringkLotNotFound:
       return StudentParkingExceptionMessageConstant.parkingLotNotFound(
          studentId ?? "-",
        );
    }
  }
}
