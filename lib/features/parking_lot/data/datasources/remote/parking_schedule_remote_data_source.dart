import '../../models/parking_schedule_model.dart';

abstract class ParkingScheduleRemoteDataSource {
  Future<List<ParkingScheduleModel>> getParkingScheduleList(String day);
}
