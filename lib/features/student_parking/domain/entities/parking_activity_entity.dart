import 'package:cloud_firestore/cloud_firestore.dart';

class ParkingActivityEntity {
  final String id;
  final String studentId;
  final String parkingHistoryId;
  final String parkingLotId;
  final Timestamp? createdAt;

  const ParkingActivityEntity({
    required this.id,
    required this.studentId,
    required this.parkingHistoryId,
    required this.parkingLotId,
    this.createdAt,
  });
}
