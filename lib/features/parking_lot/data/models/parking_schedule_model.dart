import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/failures/common_failure_type.dart';
import '../../../../core/failures/exception.dart';

class ParkingScheduleModel {
  final String id;
  final String dayOfWeek;
  final String? openTime;
  final String? closedTime;
  final bool isClosed;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;

  const ParkingScheduleModel({
    required this.id,
    required this.dayOfWeek,
    required this.openTime,
    required this.closedTime,
    required this.isClosed,
    this.createdAt,
    this.updatedAt,
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
      openTime: data['open_time'],
      closedTime: data['closed_time'],
      isClosed: data['is_closed'] ?? false,
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }

  factory ParkingScheduleModel.fromJson(Map<String, dynamic> json) {
    return ParkingScheduleModel(
      id: json['id'] ?? '',
      dayOfWeek: json['day_of_week'] ?? '',
      openTime: json['open_time'],
      closedTime: json['closed_time'],
      isClosed: json['is_closed'] == 1,
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

  Map<String, dynamic> toFirestore() {
    return {
      'day_of_week': dayOfWeek,
      'open_time': openTime,
      'closed_time': closedTime,
      'is_closed': isClosed,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'day_of_week': dayOfWeek,
      'open_time': openTime,
      'closed_time': closedTime,
      'is_closed': isClosed ? 1 : 0,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
    };
  }

  @override
  String toString() {
    return 'ParkingScheduleModel(id: $id, dayOfWeek: $dayOfWeek, openTime: $openTime, closedTime: $closedTime, isClosed: $isClosed, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
