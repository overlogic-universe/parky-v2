import '../../data/models/parking_lot_model.dart';
import '../../domain/entities/parking_lot_entity.dart';

extension ParkingLotModelToEntity on ParkingLotModel {
  ParkingLotEntity toEntity() {
    return ParkingLotEntity(
      id: id,
      name: name,
      vehicleInCount: vehicleInCount,
      maxCapacity: maxCapacity,
      latitude: latitude,
      longitude: longitude,
      isActive: isActive,
      inactiveDescription: inactiveDescription,
    );
  }
}

extension ParkingLotEntityToModel on ParkingLotEntity {
  ParkingLotModel toModel() {
    return ParkingLotModel(
      id: id,
      name: name,
      vehicleInCount: vehicleInCount,
      maxCapacity: maxCapacity,
      latitude: latitude,
      longitude: longitude,
      isActive: isActive,
      inactiveDescription: inactiveDescription,
    );
  }
}
