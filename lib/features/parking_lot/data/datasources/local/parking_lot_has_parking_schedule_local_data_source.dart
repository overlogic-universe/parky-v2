import '../../models/parking_assignment.dart';
import '../../models/parking_schedule_model.dart';

abstract class ParkingAssignmentLocalDataSource {
  Future<void> saveParkingAssignmentList(List<ParkingAssignmentModel>? models);
  Future<List<ParkingAssignmentModel>> getParkingAssignmentListByScheduleIds(
    List<ParkingScheduleModel> scheduleList,
  );
}
