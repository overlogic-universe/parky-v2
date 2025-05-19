import 'parking_schedule_day_type.dart';

class ParkingScheduleEntity {
  final String id;
  final WeekDay? dayOfWeek;
  final String? openTime;
  final String? closedTime;
  final bool? isClosed;

  const ParkingScheduleEntity({
    required this.id,
    this.dayOfWeek,
    this.openTime,
    this.closedTime,
    this.isClosed,
  });

  ParkingScheduleEntity copyWith({
    String? id,
    WeekDay? dayOfWeek,
    String? openTime,
    String? closedTime,
    bool? isClosed,
  }) {
    return ParkingScheduleEntity(
      id: id ?? this.id,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      openTime: openTime ?? this.openTime,
      closedTime: closedTime ?? this.closedTime,
      isClosed: isClosed ?? this.isClosed,
    );
  }
}
