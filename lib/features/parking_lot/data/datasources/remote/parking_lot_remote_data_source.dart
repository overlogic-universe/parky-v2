import '../../models/parking_lot_model.dart';
import '../../models/parking_lots_has_parking_schedules_model.dart';

abstract class ParkingLotRemoteDataSource {
  Future<List<ParkingLotModel>> getParkingLotListByParkingLotHasParkingScheduleId(List<ParkingLotHasParkingScheduleModel> parkingLotHasParkingScheduleList);
}
