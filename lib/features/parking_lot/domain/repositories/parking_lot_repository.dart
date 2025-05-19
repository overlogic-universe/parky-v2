import '../../../../core/utils/resource_state.dart';
import '../entities/parking_lot_entity.dart';
import '../entities/parking_lot_has_parking_schedule_entity.dart';

abstract class ParkingLotRepository {
  Future<ResourceState<List<ParkingLotEntity>>>
  getParkingLotListByParkingLotHasParkingScheduleId(
    List<ParkingLotHasParkingScheduleEntity> parkingLotHasParkingScheduleList,
  );
}
