import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/park_entity.dart';

class ParkModel {
  final String id;
  final ParkStatus status;
  final String lastActivity;
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
      lastActivity: json['lastActivity'] as String,
      userId: json['userId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status.name,
      'lastActivity': lastActivity,
      'userId': userId,
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
      lastActivity: data['lastActivity'] as String,
      userId: data['userId'] as String,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'status': status.name,
      'lastActivity': lastActivity,
      'userId': userId,
    };
  }
}
