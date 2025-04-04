import '../../../../core/utils/resource_state.dart';
import '../entities/park_entity.dart';
import '../entities/vehicle_entity.dart';

abstract class UserParkingRepository {
  Future<ResourceState<ParkEntity>> getParkByUserId();
  Future<ResourceState<VehicleEntity>> getVehicleByUserId();
}
