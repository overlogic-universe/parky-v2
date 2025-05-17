import 'package:parky/features/parking_lot/data/models/parking_lot_model.dart';

import '../../models/parking_history_model.dart';
import '../../models/vehicle_model.dart';

abstract class StudentParkingRemoteDataSource {
  Future<ParkingHistoryModel> getCurrentParkingHistoryByStudentId();
  Future<ParkingLotModel> getCurrentParkingLotByStudentId();
  Future<VehicleModel> getVehicleByStudentId();
}
