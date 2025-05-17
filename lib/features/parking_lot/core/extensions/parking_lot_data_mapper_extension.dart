import '../../data/models/parking_lot_model.dart';
import '../../domain/entities/parking_lot_entity.dart';

extension ParkingLotModelToEntity on ParkingLotModel {
  ParkingLotEntity toEntity() {
    return ParkingLotEntity(
      id: id,
      name: name,
      vehichleInCount: vehichleInCount,
      maxCapacity: maxCapacity,
      latitude: latitude,
      longitude: longitude,
      isActive: isActive,
      inActiveDescription: inActiveDescription,
    );
  }
}

extension ParkingLotEntityToModel on ParkingLotEntity {
  ParkingLotModel toModel() {
    return ParkingLotModel(
      id: id,
      name: name ?? '',
      vehichleInCount: vehichleInCount ?? 0,
      maxCapacity: maxCapacity ?? 0,
      latitude: latitude,
      longitude: longitude,
      isActive: isActive ?? false,
      inActiveDescription: inActiveDescription,
    );
  }
}
