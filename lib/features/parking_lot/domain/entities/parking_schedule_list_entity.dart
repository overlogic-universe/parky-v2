import 'parking_lot_entity.dart';
import 'parking_schedule_entity.dart';

class ParkingScheduleListEntity {
  final ParkingLotEntity parkingLot;
  final ParkingScheduleEntity parkingSchedule;

  const ParkingScheduleListEntity({
    required this.parkingLot,
    required this.parkingSchedule,
  });
}
