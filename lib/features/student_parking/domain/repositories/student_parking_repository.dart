import '../../../../core/utils/resource_state.dart';
import '../entities/park_entity.dart';
import '../entities/vehicle_entity.dart';

abstract class StudentParkingRepository {
  Future<ResourceState<ParkEntity>> getParkBystudentId();
  Future<ResourceState<VehicleEntity>> getVehicleBystudentId();
}
