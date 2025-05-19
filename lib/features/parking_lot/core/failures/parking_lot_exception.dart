import '../constant/failures/parking_lot_exception_message_constant.dart';
import 'parking_lot_failure_type.dart';

class ParkingLotException implements Exception {
  final String message;
  final ParkingLotFailureType type;

  const ParkingLotException._internal({
    required this.message,
    required this.type,
  });

  factory ParkingLotException({
    required ParkingLotFailureType type,
    String? message,
    String? studentId,
  }) {
    final resolvedMessage = message ?? _mapTypeToMessage(studentId, type);
    return ParkingLotException._internal(message: resolvedMessage, type: type);
  }

  static String _mapTypeToMessage(
    String? studentId,
    ParkingLotFailureType type,
  ) {
    switch (type) {
      case ParkingLotFailureType.paringkLotNotFound:
        return ParkingLotExceptionMessageConstant.parkingLotNotFound(
          studentId ?? "-",
        );
    }
  }
}
