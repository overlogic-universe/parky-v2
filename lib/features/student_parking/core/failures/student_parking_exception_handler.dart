import 'package:flutter/material.dart';

import '../../../../core/utils/lang.dart';
import '../../../student_parking/core/failures/student_parking_exception.dart';
import '../../../student_parking/core/failures/student_parking_failure_type.dart';

class StudentParkingExceptionHandler {
  const StudentParkingExceptionHandler._();

  static String of(BuildContext context, StudentParkingException error) {
    final lang = Lang.of(context);
    switch (error.type) {
      case StudentParkingFailureType.parkNotFound:
        return lang.getParkFailed;
      case StudentParkingFailureType.vehicleNotFound:
        return lang.getVehicleFailed;
    }
  }
}
