import 'package:parky/features/parking_lot/data/models/parking_schedule_model.dart';

import '../../models/parking_lots_has_parking_schedules_model.dart';

abstract class ParkingLotHasParkingScheduleRemoteDataSource {
  Future<List<ParkingLotHasParkingScheduleModel>> getParkingLotHasParkingScheduleListByScheduleIds(List<ParkingScheduleModel> parkingScheduleList);
}
