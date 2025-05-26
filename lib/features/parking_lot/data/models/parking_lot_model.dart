import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/failures/common_failure_type.dart';
import '../../../../core/failures/exception.dart';

class ParkingLotModel {
  final String id;
  final String name;
  final int maxCapacity;
  final double? latitude;
  final double? longitude;
  final bool isActive;
  final String? inactiveDescription;
  final int vehicleInCount;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;

  const ParkingLotModel({
    required this.id,
    required this.name,
    required this.maxCapacity,
    this.latitude,
    this.longitude,
    required this.isActive,
    this.inactiveDescription,
    required this.vehicleInCount,
    this.createdAt,
    this.updatedAt,
  });

  factory ParkingLotModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data();
    if (data == null) {
      throw CommonException(type: CommonFailureType.documentDataIsNull);
    }

    return ParkingLotModel(
      id: doc.id,
      name: data['name'] ?? '',
      maxCapacity: data['max_capacity'] ?? 0,
      latitude:
          data['latitude'] != null
              ? (data['latitude'] as num).toDouble()
              : null,
      longitude:
          data['longitude'] != null
              ? (data['longitude'] as num).toDouble()
              : null,
      isActive: data['is_active'] ?? true,
      inactiveDescription: data['inactive_description'],
      vehicleInCount: data['vehicle_in_count'] ?? 0,
      createdAt: data['created_at'] as Timestamp?,
      updatedAt: data['updated_at'] as Timestamp?,
    );
  }

  factory ParkingLotModel.fromJson(Map<String, dynamic> json) {
    return ParkingLotModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      maxCapacity: json['max_capacity'] ?? 0,
      latitude:
          json['latitude'] != null
              ? (json['latitude'] as num).toDouble()
              : null,
      longitude:
          json['longitude'] != null
              ? (json['longitude'] as num).toDouble()
              : null,
      isActive: json['is_active'] == 1,
      inactiveDescription: json['inactive_description'],
      vehicleInCount: json['vehicle_in_count'] ?? 0,
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
      'name': name,
      'max_capacity': maxCapacity,
      'latitude': latitude,
      'longitude': longitude,
      'is_active': isActive ? 1 : 0,
      'inactive_description': inactiveDescription,
      'vehicle_in_count': vehicleInCount,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
    };
  }

  ParkingLotModel copyWith({
    String? id,
    String? name,
    int? maxCapacity,
    double? latitude,
    double? longitude,
    bool? isActive,
    String? inactiveDescription,
    int? vehicleInCount,
    Timestamp? createdAt,
    Timestamp? updatedAt,
  }) {
    return ParkingLotModel(
      id: id ?? this.id,
      name: name ?? this.name,
      maxCapacity: maxCapacity ?? this.maxCapacity,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isActive: isActive ?? this.isActive,
      inactiveDescription: inactiveDescription ?? this.inactiveDescription,
      vehicleInCount: vehicleInCount ?? this.vehicleInCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'ParkingLotModel(id: $id, name: $name, maxCapacity: $maxCapacity, latitude: $latitude, longitude: $longitude, isActive: $isActive, inactiveDescription: $inactiveDescription, vehicleInCount: $vehicleInCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
