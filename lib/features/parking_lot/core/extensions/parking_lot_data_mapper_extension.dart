import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/models/parking_lot_model.dart';
import '../../domain/entities/parking_lot_entity.dart';

extension ParkingLotModelToEntity on ParkingLotModel {
  ParkingLotEntity toEntity() {
    return ParkingLotEntity(
      id: id,
      name: name,
      maxCapacity: maxCapacity,
      latitude: latitude,
      longitude: longitude,
      vehicleInCount: vehicleInCount,
      isActive: isActive,
      inactiveDescription: inactiveDescription,
      createdAt: createdAt?.toDate(),
      updatedAt: updatedAt?.toDate(),
    );
  }
}

extension ParkingLotEntityToModel on ParkingLotEntity {
  ParkingLotModel toModel() {
    return ParkingLotModel(
      id: id,
      name: name,
      maxCapacity: maxCapacity,
      latitude: latitude,
      vehicleInCount: vehicleInCount,
      longitude: longitude,
      isActive: isActive,
      inactiveDescription: inactiveDescription,
      createdAt: createdAt != null ? Timestamp.fromDate(createdAt!) : null,
      updatedAt: updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
    );
  }
}
