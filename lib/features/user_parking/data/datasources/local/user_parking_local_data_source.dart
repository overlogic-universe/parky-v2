import '../../models/park_model.dart';
import '../../models/vehicle_mode.dart';

abstract class UserParkingLocalDataSource {
  Future<void> saveVehicleModel(VehicleModel? vehicleModel);
  Future<VehicleModel?> getVehicleModel();
  Future<void> saveParkModel(ParkModel? parkModel);
  Future<ParkModel?> getParkModel();
}