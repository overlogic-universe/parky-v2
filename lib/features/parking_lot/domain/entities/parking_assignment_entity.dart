class ParkingAssignmentEntity {
  final String id;
  final String parkingLotId;
  final String parkingScheduleId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ParkingAssignmentEntity({
    required this.id,
    required this.parkingLotId,
    required this.parkingScheduleId,
    this.createdAt,
    this.updatedAt,
  });
}
