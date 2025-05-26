
class ParkingActivityEntity {
  final String id;
  final String studentId;
  final String parkingHistoryId;
  final String? parkingLotId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ParkingActivityEntity({
    required this.id,
    required this.studentId,
    required this.parkingHistoryId,
    this.parkingLotId,
    this.createdAt,
    this.updatedAt,
  });
}
