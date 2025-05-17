import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/failures/common_failure_type.dart';
import '../../../../core/failures/exception.dart';

class ParkingActivityModel {
  final String id;
  final String studentId;
  final String parkingLotId;
  final String parkingHistoryId;

  const ParkingActivityModel({
    required this.id,
    required this.studentId,
    required this.parkingLotId,
    required this.parkingHistoryId,
  });

  factory ParkingActivityModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data();
    if (data == null) {
      throw CommonException(type: CommonFailureType.documentDataIsNull);
    }

    return ParkingActivityModel(
      id: doc.id,
      studentId: data['student_id'] ?? '',
      parkingLotId: data['parking_lot_id'] ?? '',
      parkingHistoryId: data['parking_history_id'] ?? '',
    );
  }

  factory ParkingActivityModel.fromJson(Map<String, dynamic> json) {
    return ParkingActivityModel(
      id: json['id'] ?? '',
      studentId: json['student_id'] ?? '',
      parkingLotId: json['parking_lot_id'] ?? '',
      parkingHistoryId: json['parking_history_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'student_id': studentId,
      'parking_lot_id': parkingLotId,
      'parking_history_id': parkingHistoryId,
    };
  }

  @override
  String toString() {
    return 'ParkingActivityModel(id: $id, studentId: $studentId, parkingLotId: $parkingLotId, parkingHistoryId: $parkingHistoryId)';
  }
}
