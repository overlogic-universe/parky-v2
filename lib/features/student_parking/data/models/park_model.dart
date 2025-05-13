import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/park_entity.dart';

class ParkModel {
  final String id;
  final ParkStatus status;
  final Timestamp lastActivity;
  final String studentId;

  ParkModel({
    required this.id,
    required this.status,
    required this.lastActivity,
    required this.studentId,
  });

  factory ParkModel.fromJson(Map<String, dynamic> json) {
    return ParkModel(
      id: json['id'] as String,
      status: ParkStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => ParkStatus.parking,
      ),
      lastActivity: Timestamp.fromMillisecondsSinceEpoch(
        json['last_activity'] as int,
      ),
      studentId: json['student_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status.name,
      'last_activity': lastActivity.millisecondsSinceEpoch,
      'student_id': studentId,
    };
  }

  factory ParkModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return ParkModel(
      id: doc.id,
      status: ParkStatus.values.firstWhere(
        (e) => e.name == data['status'],
        orElse: () => ParkStatus.parking,
      ),
      lastActivity: data['last_activity'] as Timestamp,
      studentId: data['student_id'] as String,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'status': status.name,
      'last_activity': lastActivity,
      'student_id': studentId,
    };
  }
}
