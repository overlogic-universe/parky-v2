import 'package:flutter/material.dart';

import '../../../../core/utils/lang.dart';
import '../../domain/entities/parking_schedule_day_type.dart';

extension WeekDayExtension on WeekDay {
  String displayName(BuildContext context) {
    switch (this) {
      case WeekDay.monday:
        return Lang.of(context).monday;
      case WeekDay.tuesday:
        return Lang.of(context).tuesday;
      case WeekDay.wednesday:
        return Lang.of(context).wednesday;
      case WeekDay.thursday:
        return Lang.of(context).thursday;
      case WeekDay.friday:
        return Lang.of(context).friday;
      case WeekDay.saturday:
        return Lang.of(context).saturday;
      case WeekDay.sunday:
        return Lang.of(context).sunday;
    }
  }
}
