import 'parking_lot_entity.dart';
import 'parking_schedule_entity.dart';

class ParkingLotScheduleEntity {
  final ParkingLotEntity parkingLot;
  final ParkingScheduleEntity parkingSchedule;

  ParkingLotScheduleEntity({
    required this.parkingLot,
    required this.parkingSchedule,
  });

  @override
  String toString() {
    return 'ParkingLotScheduleEntity(lot: ${parkingLot.name}, schedule: ${parkingSchedule.dayOfWeek})';
  }
}
