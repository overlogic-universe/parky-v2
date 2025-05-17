import 'parking_lot_entity.dart';
import 'parking_schedule_entity.dart';

class ParkingLotScheduleEntity {
  final ParkingLotEntity parkingLot;
  final ParkingScheduleEntity parkingSchedule;

  const ParkingLotScheduleEntity({
    required this.parkingLot,
    required this.parkingSchedule,
  });
}
