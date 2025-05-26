import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/models/parking_schedule_model.dart';
import '../../domain/entities/parking_schedule_day_type.dart';
import '../../domain/entities/parking_schedule_entity.dart';

extension ParkingScheduleModelToEntity on ParkingScheduleModel {
  ParkingScheduleEntity toEntity() {
    return ParkingScheduleEntity(
      id: id,
      dayOfWeek: WeekDay.fromString(dayOfWeek),
      openTime: openTime,
      closedTime: closedTime,
      isClosed: isClosed,
      createdAt: createdAt?.toDate(),
      updatedAt: updatedAt?.toDate(),
    );
  }
}

extension ParkingScheduleEntityToModel on ParkingScheduleEntity {
  ParkingScheduleModel toModel() {
    return ParkingScheduleModel(
      id: id,
      dayOfWeek: dayOfWeek?.value ?? WeekDay.monday.value,
      openTime: openTime,
      closedTime: closedTime,
      isClosed: isClosed ?? true,
      createdAt: createdAt != null ? Timestamp.fromDate(createdAt!) : null,
      updatedAt: updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
    );
  }
}
