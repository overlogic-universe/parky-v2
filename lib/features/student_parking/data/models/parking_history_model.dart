import 'package:cloud_firestore/cloud_firestore.dart';

class ParkingHistoryModel {
  final String id;
  final String? status;
  final Timestamp? parkedAt;
  final Timestamp? exitedAt;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;

  const ParkingHistoryModel({
    required this.id,
    this.status,
    this.parkedAt,
    this.exitedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory ParkingHistoryModel.fromJson(Map<String, dynamic> json) {
    return ParkingHistoryModel(
      id: json['id'] as String,
      status: json['status'] as String?,
      parkedAt:
          json['parked_at'] != null
              ? Timestamp.fromMillisecondsSinceEpoch(json['parked_at'] as int)
              : null,
      exitedAt:
          json['exited_at'] != null
              ? Timestamp.fromMillisecondsSinceEpoch(json['exited_at'] as int)
              : null,
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'parked_at': parkedAt?.millisecondsSinceEpoch,
      'exited_at': exitedAt?.millisecondsSinceEpoch,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory ParkingHistoryModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data();
    return ParkingHistoryModel(
      id: doc.id,
      status: data?['status'] as String?,
      parkedAt: data?['parked_at'] as Timestamp?,
      exitedAt: data?['exited_at'] as Timestamp?,
      createdAt: data?['created_at'] as Timestamp?,
      updatedAt: data?['updated_at'] as Timestamp?,
    );
  }

  @override
  String toString() {
    return 'ParkingHistoryModel('
        'id: $id, '
        'status: $status, '
        'parkedAt: ${parkedAt?.toDate()}, '
        'exitedAt: ${exitedAt?.toDate()}, '
        'createdAt: ${createdAt?.toDate()}, '
        'updatedAt: ${updatedAt?.toDate()}'
        ')';
  }
}
