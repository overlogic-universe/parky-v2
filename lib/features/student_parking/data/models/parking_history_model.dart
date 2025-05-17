import 'package:cloud_firestore/cloud_firestore.dart';

class ParkingHistoryModel {
  final String id;
  final String? status;
  final Timestamp? parkedAt;
  final Timestamp? exitedAt;

  const ParkingHistoryModel({
    required this.id,
    this.status,
    this.parkedAt,
    this.exitedAt,
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
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'parked_at': parkedAt?.millisecondsSinceEpoch,
      'exited_at': exitedAt?.millisecondsSinceEpoch,
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
    );
  }

  @override
  String toString() {
    return 'ParkingHistoryModel('
        'id: $id, '
        'status: $status, '
        'parkedAt: ${parkedAt?.toDate()}, '
        'exitedAt: ${exitedAt?.toDate()}'
        ')';
  }
}
