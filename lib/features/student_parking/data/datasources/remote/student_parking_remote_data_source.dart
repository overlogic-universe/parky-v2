import '../../models/park_model.dart';
import '../../models/vehicle_mode.dart';

abstract class StudentParkingRemoteDataSource {
  Future<ParkModel> getParkBystudentId();
  Future<VehicleModel> getVehicleBystudentId();
}
