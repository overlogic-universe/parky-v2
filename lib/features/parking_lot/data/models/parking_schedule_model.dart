import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/failures/common_failure_type.dart';
import '../../../../core/failures/exception.dart';

class ParkingScheduleModel {
  final String id;
  final String dayOfWeek;
  final Timestamp openTime;
  final Timestamp closedTime;
  final bool isClosed;

  const ParkingScheduleModel({
    required this.id,
    required this.dayOfWeek,
    required this.openTime,
    required this.closedTime,
    required this.isClosed,
  });

  factory ParkingScheduleModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data();
    if (data == null) {
      throw CommonException(type: CommonFailureType.documentDataIsNull);
    }

    return ParkingScheduleModel(
      id: doc.id,
      dayOfWeek: data['day_of_week'] ?? '',
      openTime: data['open_time'] ?? Timestamp(0, 0),
      closedTime: data['closed_time'] ?? Timestamp(0, 0),
      isClosed: data['is_closed'] ?? false,
    );
  }

  factory ParkingScheduleModel.fromJson(Map<String, dynamic> json) {
    return ParkingScheduleModel(
      id: json['id'] ?? '',
      dayOfWeek: json['day_of_week'] ?? '',
      openTime: json['open_time'] ?? Timestamp(0, 0),
      closedTime: json['closed_time'] ?? Timestamp(0, 0),
      isClosed: json['is_closed'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'day_of_week': dayOfWeek,
      'open_time': openTime,
      'closed_time': closedTime,
      'is_closed': isClosed,
    };
  }

  @override
  String toString() {
    return 'ParkingScheduleModel(id: $id, dayOfWeek: $dayOfWeek, openTime: $openTime, closedTime: $closedTime, isClosed: $isClosed)';
  }
}
