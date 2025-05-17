import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/failures/common_failure_type.dart';
import '../../../../core/failures/exception.dart';

class ParkingLotsHasParkingSchedulesModel {
  final String id;
  final String parkingLotId;
  final String parkingScheduleId;

  const ParkingLotsHasParkingSchedulesModel({
    required this.id,
    required this.parkingLotId,
    required this.parkingScheduleId,
  });
  
  factory ParkingLotsHasParkingSchedulesModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data();
    if (data == null) {
      throw CommonException(type: CommonFailureType.documentDataIsNull);
    }

    return ParkingLotsHasParkingSchedulesModel(
      id: doc.id,
      parkingLotId: data['parking_lot_id'] ?? '',
      parkingScheduleId: data['parking_schedule_id'] ?? '',
    );
  }

  factory ParkingLotsHasParkingSchedulesModel.fromJson(Map<String, dynamic> json) {
    return ParkingLotsHasParkingSchedulesModel(
      id: json['id'] ?? '',
      parkingLotId: json['parking_lot_id'] ?? '',
      parkingScheduleId: json['parking_schedule_id'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'parking_lot_id': parkingLotId,
      'parking_schedule_id': parkingScheduleId,
    };
  }

  @override
  String toString() {
    return 'ParkingLotsHasParkingSchedulesModel(id: $id, parkingLotId: $parkingLotId, parkingScheduleId: $parkingScheduleId)';
  }
}
