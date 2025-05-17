import '../../../../core/utils/resource_state.dart';
import '../entities/parking_history_entity.dart';
import '../entities/vehicle_entity.dart';

abstract class StudentParkingRepository {
  Future<ResourceState<ParkingHistoryEntity>> getParkHistoryByStudentId();
  Future<ResourceState<VehicleEntity>> getVehicleByStudentId();
  Future<ResourceState<VehicleEntity>> getParkingLotByStudentId();
}
