import '../../models/parking_history_model.dart';
import '../../models/vehicle_model.dart';

abstract class StudentParkingLocalDataSource {
  Future<void> saveVehicleModel(VehicleModel? vehicleModel);
  Future<VehicleModel?> getVehicleModel();
  Future<void> saveParkingHistoryModel(
    ParkingHistoryModel? parkingHistoryModel,
  );
  Future<ParkingHistoryModel?> getParkingHistoryModel();
}
