import '../../../../core/utils/resource_state.dart';
import '../entities/parking_lot_has_parking_schedule_entity.dart';
import '../entities/parking_schedule_entity.dart';

abstract class ParkingLotHasParkingScheduleRepository {
  Future<ResourceState<List<ParkingLotHasParkingScheduleEntity>>>
  getParkingLotHasParkingScheduleListByScheduleIds(
    List<ParkingScheduleEntity> parkingScheduleList,
  );
}
