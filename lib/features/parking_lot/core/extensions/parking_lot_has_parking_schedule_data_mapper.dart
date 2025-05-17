import '../../data/models/parking_lots_has_parking_schedules_model.dart';
import '../../domain/entities/parking_lot_has_parking_schedule_entity.dart';

extension ParkingLotHasParkingScheduleModelToEntity
    on ParkingLotHasParkingScheduleModel {
  ParkingLotHasParkingScheduleEntity toEntity() {
    return ParkingLotHasParkingScheduleEntity(
      id: id,
      parkingLotId: parkingLotId,
      parkingScheduleId: parkingScheduleId,
    );
  }
}

extension ParkingLotHasParkingScheduleEntityToModel
    on ParkingLotHasParkingScheduleEntity {
  ParkingLotHasParkingScheduleModel toModel() {
    return ParkingLotHasParkingScheduleModel(
      id: id,
      parkingLotId: parkingLotId,
      parkingScheduleId: parkingScheduleId,
    );
  }
}
