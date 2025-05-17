import '../../../auth/domain/entities/student_entity.dart';
import '../../../student_parking/domain/entities/parking_history_entity.dart';
import '../../../parking_lot/domain/entities/parking_lot_entity.dart';

class ParkingActivityEntity {
  final String id;
  final StudentEntity student;
  final ParkingLotEntity parkingLot;
  final ParkingHistoryEntity parkingHistory;

  const ParkingActivityEntity({
    required this.id,
    required this.student,
    required this.parkingLot,
    required this.parkingHistory,
  });
}
