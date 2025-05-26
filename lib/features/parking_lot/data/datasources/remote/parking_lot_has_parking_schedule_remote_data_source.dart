import '../../models/parking_assignment.dart';
import '../../models/parking_schedule_model.dart';

abstract class ParkingAssignmentRemoteDataSource {
  Future<List<ParkingAssignmentModel>> getParkingAssignmentListByScheduleIds(
    List<ParkingScheduleModel> parkingScheduleList,
  );
}
