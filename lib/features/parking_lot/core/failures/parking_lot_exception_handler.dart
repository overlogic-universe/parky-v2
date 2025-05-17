import 'package:flutter/material.dart';

import '../../../../core/utils/lang.dart';
import 'parking_lot_exception.dart';
import 'parking_lot_failure_type.dart';

class ParkingLotExceptionHandler {
  const ParkingLotExceptionHandler._();

  static String of(BuildContext context, ParkingLotException error) {
    final lang = Lang.of(context);
    switch (error.type) {
      case ParkingLotFailureType.paringkLotNotFound:
        return lang.getParkingLotFailed;
    }
  }
}
