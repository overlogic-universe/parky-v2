import 'parking_lot_entity.dart';
import 'parking_schedule_entity.dart';

class ParkingLotsHasParkingSchedulesEntity {
  final String id;
  final ParkingLotEntity parkingLot;
  final ParkingScheduleEnity parkingSchedule;

  const ParkingLotsHasParkingSchedulesEntity({
    required this.id,
    required this.parkingLot,
    required this.parkingSchedule,
  });
}
