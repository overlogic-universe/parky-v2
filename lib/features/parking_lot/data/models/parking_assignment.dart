import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/failures/common_failure_type.dart';
import '../../../../core/failures/exception.dart';

class ParkingAssignmentModel {
  final String id;
  final String parkingLotId;
  final String parkingScheduleId;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;

  const ParkingAssignmentModel({
    required this.id,
    required this.parkingLotId,
    required this.parkingScheduleId,
    this.createdAt,
    this.updatedAt,
  });

  factory ParkingAssignmentModel.fromJson(Map<String, dynamic> json) {
    return ParkingAssignmentModel(
      id: json['id'] as String,
      parkingLotId: json['parking_lot_id'] as String,
      parkingScheduleId: json['parking_schedule_id'] as String,
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

  factory ParkingAssignmentModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data();
    if (data == null) {
      throw CommonException(type: CommonFailureType.documentDataIsNull);
    }
    return ParkingAssignmentModel(
      id: doc.id,
      parkingLotId: data['parking_lot_id'] as String,
      parkingScheduleId: data['parking_schedule_id'] as String,
      createdAt: data['created_at'] as Timestamp?,
      updatedAt: data['updated_at'] as Timestamp?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'parking_lot_id': parkingLotId,
      'parking_schedule_id': parkingScheduleId,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
    };
  }

  ParkingAssignmentModel copyWith({
    String? id,
    String? parkingLotId,
    String? parkingScheduleId,
    String? parkingAttendantId,
    Timestamp? createdAt,
    Timestamp? updatedAt,
  }) {
    return ParkingAssignmentModel(
      id: id ?? this.id,
      parkingLotId: parkingLotId ?? this.parkingLotId,
      parkingScheduleId: parkingScheduleId ?? this.parkingScheduleId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'ParkingAssignmentModel(id: $id, parkingLotId: $parkingLotId, parkingScheduleId: $parkingScheduleId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
