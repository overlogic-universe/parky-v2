import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/park_entity.dart';

class ParkModel {
  final String id;
  final ParkStatus status;
  final Timestamp lastActivity;
  final String userId;

  ParkModel({
    required this.id,
    required this.status,
    required this.lastActivity,
    required this.userId,
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
      userId: json['user_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status.name,
      'last_activity': lastActivity.millisecondsSinceEpoch,
      'user_id': userId,
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
      userId: data['user_id'] as String,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'status': status.name,
      'last_activity': lastActivity,
      'user_id': userId,
    };
  }
}
