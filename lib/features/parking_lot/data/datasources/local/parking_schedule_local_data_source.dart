import '../../models/parking_schedule_model.dart';

abstract class ParkingScheduleLocalDataSource {
  Future<List<ParkingScheduleModel>> getParkingScheduleModelByDay(String day);
  Future<void> saveParkingScheduleModelList(List<ParkingScheduleModel>? modelList);
}
