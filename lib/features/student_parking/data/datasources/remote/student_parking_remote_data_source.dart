import '../../models/parking_history_model.dart';
import '../../models/vehicle_model.dart';

abstract class StudentParkingRemoteDataSource {
  Future<ParkingHistoryModel> getParkHistoryByStudentId();
  Future<VehicleModel> getVehicleByStudentId();
}
