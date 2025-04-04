import '../../models/park_model.dart';
import '../../models/vehicle_mode.dart';

abstract class UserParkingRemoteDataSource {
  Future<ParkModel> getParkByUserId();
  Future<VehicleModel> getVehicleByUserId();
}
