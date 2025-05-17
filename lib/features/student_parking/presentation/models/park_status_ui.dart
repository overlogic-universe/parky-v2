import 'package:flutter/material.dart';

import '../../../../core/utils/lang.dart';
import '../../domain/entities/park_status.dart';

extension ParkStatusExtension on ParkStatus? {
  String? displayName(BuildContext context) {
    switch (this) {
      case ParkStatus.parked:
        return Lang.of(context).parked;
      case ParkStatus.exited:
        return Lang.of(context).exited;
      case null:
        return null;
    }
  }
}
