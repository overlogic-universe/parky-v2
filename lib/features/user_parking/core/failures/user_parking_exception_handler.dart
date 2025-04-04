import 'package:flutter/material.dart';

import '../../../../core/utils/lang.dart';
import 'user_parking_exception.dart';

class UserParkingExceptionHandler {
  const UserParkingExceptionHandler._();

  static String of(BuildContext context, UserParkingException error) {
    final lang = Lang.of(context);
    switch (error.type) {
      case UserParkingFailureType.parkNotFound:
        return lang.getParkFailed;
      case UserParkingFailureType.vehicleNotFound:
        return lang.getVehicleFailed;
    }
  }
}
