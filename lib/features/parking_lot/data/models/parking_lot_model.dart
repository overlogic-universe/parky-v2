import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/failures/common_failure_type.dart';
import '../../../../core/failures/exception.dart';

class ParkingLotModel {
  final String id;
  final String name;
  final int vehichleInCount;
  final int maxCapacity;
  final double? latitude;
  final double? longitude;
  final bool isActive;
  final String? inactiveDescription;

  const ParkingLotModel({
    required this.id,
    required this.name,
    required this.vehichleInCount,
    required this.maxCapacity,
    this.latitude,
    this.longitude,
    required this.isActive,
    this.inactiveDescription,
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
      vehichleInCount: data['vehicle_in_count'] ?? 0,
      maxCapacity: data['max_capacity'] ?? 0,
      latitude:
          (data['latitude'] != null)
              ? (data['latitude'] as num).toDouble()
              : null,
      longitude:
          (data['longitude'] != null)
              ? (data['longitude'] as num).toDouble()
              : null,
      isActive: data['is_active'] ?? true,
      inactiveDescription: data['inactive_description'],
    );
  }

  factory ParkingLotModel.fromJson(Map<String, dynamic> json) {
    return ParkingLotModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      vehichleInCount: json['vehicle_in_count'] ?? 0,
      maxCapacity: json['max_capacity'] ?? 0,
      latitude:
          (json['latitude'] != null)
              ? (json['latitude'] as num).toDouble()
              : null,
      longitude:
          (json['longitude'] != null)
              ? (json['longitude'] as num).toDouble()
              : null,
      isActive: json['is_active'] == 1,
      inactiveDescription: json['inactive_description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'vehicle_in_count': vehichleInCount,
      'max_capacity': maxCapacity,
      'latitude': latitude,
      'longitude': longitude,
      'is_active': isActive ? 1 : 0,
      'inactive_description': inactiveDescription,
    };
  }

  ParkingLotModel copyWith({
    String? id,
    String? name,
    int? vehichleInCount,
    int? maxCapacity,
    double? latitude,
    double? longitude,
    bool? isActive,
    String? inactiveDescription,
  }) {
    return ParkingLotModel(
      id: id ?? this.id,
      name: name ?? this.name,
      vehichleInCount: vehichleInCount ?? this.vehichleInCount,
      maxCapacity: maxCapacity ?? this.maxCapacity,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isActive: isActive ?? this.isActive,
      inactiveDescription: inactiveDescription ?? this.inactiveDescription,
    );
  }

  @override
  String toString() {
    return 'ParkingLotModel(id: $id, name: $name, vehicleInCount: $vehichleInCount, maxCapacity: $maxCapacity, latitude: $latitude, longitude: $longitude, isActive: $isActive, inactiveDescription: $inactiveDescription)';
  }
}
