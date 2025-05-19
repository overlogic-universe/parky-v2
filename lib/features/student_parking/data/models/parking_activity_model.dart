import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/parking_activity_entity.dart';

class ParkingActivityModel {
  final String id;
  final String studentId;
  final String parkingHistoryId;
  final String? parkingLotId;
  final Timestamp? createdAt;

  const ParkingActivityModel({
    required this.id,
    required this.studentId,
    required this.parkingHistoryId,
    required this.parkingLotId,
    this.createdAt,
  });

  factory ParkingActivityModel.fromJson(Map<String, dynamic> json) {
    return ParkingActivityModel(
      id: json['id'] as String,
      studentId: json['student_id'] as String,
      parkingHistoryId: json['parking_history_id'] as String,
      parkingLotId:
          json['parking_lot_id'] != null
              ? json['parking_lot_id'] as String
              : null,
      createdAt:
          json['created_at'] != null ? json['created_at'] as Timestamp : null,
    );
  }

  factory ParkingActivityModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ParkingActivityModel(
      id: doc.id,
      studentId: data['student_id'] as String,
      parkingHistoryId: data['parking_history_id'] as String,
      parkingLotId:
          data['parking_lot_id'] != null
              ? data['parking_lot_id'] as String
              : null,
      createdAt:
          data['created_at'] != null ? data['created_at'] as Timestamp : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'student_id': studentId,
      'parking_history_id': parkingHistoryId,
      'parking_lot_id': parkingLotId,
      'created_at': createdAt,
    };
  }

  ParkingActivityEntity toEntity() {
    return ParkingActivityEntity(
      id: id,
      studentId: studentId,
      parkingHistoryId: parkingHistoryId,
      parkingLotId: parkingLotId,
      createdAt: createdAt,
    );
  }

  @override
  String toString() {
    return 'ParkingActivityModel(id: $id, studentId: $studentId, parkingHistoryId: $parkingHistoryId, parkingLotId: $parkingLotId, createdAt: $createdAt)';
  }
}
