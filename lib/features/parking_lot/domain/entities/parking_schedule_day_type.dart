import '../../../../core/constants/common/day_constant.dart';

enum WeekDay {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday;

  static WeekDay fromString(String? value) {
    switch (value?.toLowerCase()) {
      case DayConstant.monday:
        return WeekDay.monday;
      case DayConstant.tuesday:
        return WeekDay.tuesday;
      case DayConstant.wednesday:
        return WeekDay.wednesday;
      case DayConstant.thursday:
        return WeekDay.thursday;
      case DayConstant.friday:
        return WeekDay.friday;
      case DayConstant.saturday:
        return WeekDay.saturday;
      case DayConstant.sunday:
        return WeekDay.sunday;
      default:
        return WeekDay.monday; // fallback default
    }
  }

  String get value {
    switch (this) {
      case WeekDay.monday:
        return DayConstant.monday;
      case WeekDay.tuesday:
        return DayConstant.tuesday;
      case WeekDay.wednesday:
        return DayConstant.wednesday;
      case WeekDay.thursday:
        return DayConstant.thursday;
      case WeekDay.friday:
        return DayConstant.friday;
      case WeekDay.saturday:
        return DayConstant.saturday;
      case WeekDay.sunday:
        return DayConstant.sunday;
    }
  }

  @override
  String toString() => value;
}
