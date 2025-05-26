import 'park_status.dart';

class ParkingHistoryEntity {
  final String id;
  final ParkStatus? status;
  final DateTime? parkedAt;
  final DateTime? exitedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ParkingHistoryEntity({
    required this.id,
    required this.status,
    required this.parkedAt,
    this.exitedAt,
    this.createdAt,
    this.updatedAt,
  });
}
