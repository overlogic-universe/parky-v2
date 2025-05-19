import '../../../../core/utils/resource_state.dart';
import '../entities/parking_schedule_day_type.dart';
import '../entities/parking_schedule_entity.dart';

abstract class ParkingScheduleRepository {
  Future<ResourceState<List<ParkingScheduleEntity>>> getParkingScheduleListByDay(WeekDay day);
}
