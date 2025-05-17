import '../../../../parking_lot/data/models/parking_lot_model.dart';
import '../../models/parking_history_model.dart';
import '../../models/vehicle_model.dart';
abstract class StudentParkingLocalDataSource {
  Future<void> saveVehicleModel(VehicleModel? vehicleModel);
  Future<VehicleModel?> getVehicleModel();

  Future<void> saveParkingHistoryModel(ParkingHistoryModel? parkingHistoryModel);
  Future<ParkingHistoryModel?> getParkingHistoryModel();

  Future<void> saveParkingLotModel(ParkingLotModel? parkingLotModel);
  Future<ParkingLotModel?> getParkingLotModel();
}
