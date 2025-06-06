import 'package:cloud_firestore/cloud_firestore.dart';

class ParkingActivityModel {
  final String id;
  final String studentId;
  final String parkingHistoryId;
  final String? parkingLotId;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;

  const ParkingActivityModel({
    required this.id,
    required this.studentId,
    required this.parkingHistoryId,
    required this.parkingLotId,
    this.createdAt,
    this.updatedAt,
  });

  factory ParkingActivityModel.fromJson(Map<String, dynamic> json) {
    return ParkingActivityModel(
      id: json['id'] as String,
      studentId: json['student_id'] as String,
      parkingHistoryId: json['parking_history_id'] as String,
      parkingLotId: json['parking_lot_id'] as String?,
      createdAt:
          json['created_at'] != null
              ? Timestamp.fromMillisecondsSinceEpoch(json['created_at'] as int)
              : null,
      updatedAt:
          json['updated_at'] != null
              ? Timestamp.fromMillisecondsSinceEpoch(json['updated_at'] as int)
              : null,
    );
  }

  factory ParkingActivityModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ParkingActivityModel(
      id: doc.id,
      studentId: data['student_id'] as String,
      parkingHistoryId: data['parking_history_id'] as String,
      parkingLotId: data['parking_lot_id'] as String?,
      createdAt: data['created_at'] as Timestamp?,
      updatedAt: data['updated_at'] as Timestamp?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'student_id': studentId,
      'parking_history_id': parkingHistoryId,
      'parking_lot_id': parkingLotId,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
    };
  }

  @override
  String toString() {
    return 'ParkingActivityModel(id: $id, studentId: $studentId, parkingHistoryId: $parkingHistoryId, parkingLotId: $parkingLotId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
