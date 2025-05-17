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
    );
  }
}

extension ParkingScheduleEntityToModel on ParkingScheduleEntity {
  ParkingScheduleModel toModel() {
    return ParkingScheduleModel(
      id: id,
      dayOfWeek: dayOfWeek?.name ?? WeekDay.monday.value,
      openTime: openTime,
      closedTime: closedTime,
      isClosed: isClosed ?? true,
    );
  }
}
