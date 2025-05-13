import '../../models/park_model.dart';
import '../../models/vehicle_mode.dart';

abstract class StudentParkingLocalDataSource {
  Future<void> saveVehicleModel(VehicleModel? vehicleModel);
  Future<VehicleModel?> getVehicleModel();
  Future<void> saveParkModel(ParkModel? parkModel);
  Future<ParkModel?> getParkModel();
}