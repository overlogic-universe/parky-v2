import '../../models/parking_lots_has_parking_schedules_model.dart';
import '../../models/parking_schedule_model.dart';

abstract class ParkingLotHasParkingScheduleLocalDataSource {
  Future<void> saveParkingLotHasParkingScheduleModelList(
    List<ParkingLotHasParkingScheduleModel>? models,
  );
  Future<List<ParkingLotHasParkingScheduleModel>>
  getParkingLotHasParkingScheduleListByScheduleIds(
    List<ParkingScheduleModel> scheduleList,
  );
}
