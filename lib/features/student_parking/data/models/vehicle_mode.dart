import 'package:cloud_firestore/cloud_firestore.dart';

class VehicleModel {
  final String id;
  final String plate;
  final String studentId;

  VehicleModel({
    required this.id,
    required this.plate,
    required this.studentId,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['id'] as String,

      plate: json['plate'] as String,
      studentId: json['student_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'plate': plate, 'student_id': studentId};
  }

  factory VehicleModel.fromFirestore(
    QueryDocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data();
    return VehicleModel(
      id: doc.id,
      plate: data['plate'] as String,
      studentId: data['student_id'] as String,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {'plate': plate, 'student_id': studentId};
  }
}
