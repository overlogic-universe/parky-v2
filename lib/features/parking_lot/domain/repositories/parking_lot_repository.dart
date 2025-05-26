import '../../../../core/utils/resource_state.dart';
import '../entities/parking_lot_entity.dart';
import '../entities/parking_assignment_entity.dart';

abstract class ParkingLotRepository {
  Future<ResourceState<List<ParkingLotEntity>>>
  getParkingLotListByParkingAssignmentId(
    List<ParkingAssignmentEntity> parkingAssignmentList,
  );
}
