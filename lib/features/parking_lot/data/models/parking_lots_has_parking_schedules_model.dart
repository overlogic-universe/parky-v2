import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/failures/common_failure_type.dart';
import '../../../../core/failures/exception.dart';

class ParkingLotHasParkingScheduleModel {
  final String id;
  final String parkingLotId;
  final String parkingScheduleId;

  const ParkingLotHasParkingScheduleModel({
    required this.id,
    required this.parkingLotId,
    required this.parkingScheduleId,
  });

  factory ParkingLotHasParkingScheduleModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ParkingLotHasParkingScheduleModel(
      id: json['id'] as String,
      parkingLotId: json['parking_lot_id'] as String,
      parkingScheduleId: json['parking_schedule_id'] as String,
    );
  }

  factory ParkingLotHasParkingScheduleModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data();
    if (data == null) {
      throw CommonException(type: CommonFailureType.documentDataIsNull);
    }
    return ParkingLotHasParkingScheduleModel(
      id: doc.id,
      parkingLotId: data['parking_lot_id'] as String,
      parkingScheduleId: data['parking_schedule_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'parking_lot_id': parkingLotId,
      'parking_schedule_id': parkingScheduleId,
    };
  }

  ParkingLotHasParkingScheduleModel copyWith({
    String? id,
    String? parkingLotId,
    String? parkingScheduleId,
  }) {
    return ParkingLotHasParkingScheduleModel(
      id: id ?? this.id,
      parkingLotId: parkingLotId ?? this.parkingLotId,
      parkingScheduleId: parkingScheduleId ?? this.parkingScheduleId,
    );
  }

  @override
  String toString() =>
      'ParkingLotHasParkingScheduleModel(id: $id, parkingLotId: $parkingLotId, parkingScheduleId: $parkingScheduleId)';
}
