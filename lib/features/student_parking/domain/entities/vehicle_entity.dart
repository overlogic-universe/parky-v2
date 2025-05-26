class VehicleEntity {
  final String id;
  final String plate;
  final String studentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const VehicleEntity({
    required this.id,
    required this.plate,
    required this.studentId,
    this.createdAt,
    this.updatedAt,
  });
}
