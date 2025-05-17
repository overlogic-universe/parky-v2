import 'package:cloud_firestore/cloud_firestore.dart';

import 'park_status.dart';

class ParkingHistoryEntity {
  final String id;
  final ParkStatus? status;
  final Timestamp? parkedAt;
  final Timestamp? exitedAt;

  const ParkingHistoryEntity({
    required this.id,
    required this.status,
    required this.parkedAt,
    this.exitedAt,
  });
}
