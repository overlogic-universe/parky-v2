import '../../../../core/utils/resource_state.dart';
import '../entities/parking_assignment_entity.dart';
import '../entities/parking_schedule_entity.dart';

abstract class ParkingAssignmentRepository {
  Future<ResourceState<List<ParkingAssignmentEntity>>>
  getParkingAssignmentListByScheduleIds(
    List<ParkingScheduleEntity> parkingScheduleList,
  );
}
