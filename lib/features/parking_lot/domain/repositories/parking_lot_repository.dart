import '../../../../core/utils/resource_state.dart';
import '../entities/parking_lot_entity.dart';
import '../entities/parking_lots_has_parking_schedules.dart';

abstract class ParkingLotRepository {
  Future<ResourceState<List<ParkingLotEntity>?>> getParkingLots();
  Future<ResourceState<ParkingLotsHasParkingSchedulesEntity?>> getParkingLotScheduleBy();
}
