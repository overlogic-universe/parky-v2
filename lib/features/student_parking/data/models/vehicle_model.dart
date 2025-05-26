import 'package:cloud_firestore/cloud_firestore.dart';

class VehicleModel {
  final String id;
  final String plate;
  final String studentId;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;

  VehicleModel({
    required this.id,
    required this.plate,
    required this.studentId,
    this.createdAt,
    this.updatedAt,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['id'] as String,
      plate: json['plate'] as String,
      studentId: json['student_id'] as String,
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
      'plate': plate,
      'student_id': studentId,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory VehicleModel.fromFirestore(
    QueryDocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data();
    return VehicleModel(
      id: doc.id,
      plate: data['plate'] as String,
      studentId: data['student_id'] as String,
      createdAt: data['created_at'] as Timestamp?,
      updatedAt: data['updated_at'] as Timestamp?,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'plate': plate,
      'student_id': studentId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
