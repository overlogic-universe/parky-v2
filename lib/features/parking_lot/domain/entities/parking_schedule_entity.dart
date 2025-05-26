import 'parking_schedule_day_type.dart';

class ParkingScheduleEntity {
  final String id;
  final WeekDay? dayOfWeek;
  final String? openTime;
  final String? closedTime;
  final bool? isClosed;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ParkingScheduleEntity({
    required this.id,
    this.dayOfWeek,
    this.openTime,
    this.closedTime,
    this.isClosed,
    this.createdAt,
    this.updatedAt,
  });

  ParkingScheduleEntity copyWith({
    String? id,
    WeekDay? dayOfWeek,
    String? openTime,
    String? closedTime,
    bool? isClosed,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ParkingScheduleEntity(
      id: id ?? this.id,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      openTime: openTime ?? this.openTime,
      closedTime: closedTime ?? this.closedTime,
      isClosed: isClosed ?? this.isClosed,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
