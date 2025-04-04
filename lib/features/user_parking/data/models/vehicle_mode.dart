import 'package:cloud_firestore/cloud_firestore.dart';

class VehicleModel {
  final String id;
  final String plate;
  final String userId;

  VehicleModel({required this.id, required this.plate, required this.userId});

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['id'] as String,

      plate: json['plate'] as String,
      userId: json['userId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'plate': plate, 'userId': userId};
  }

  factory VehicleModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data()!;
    return VehicleModel(
      id: doc.id,
      plate: data['plate'] as String,
      userId: data['userId'] as String,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {'plate': plate, 'userId': userId};
  }
}
