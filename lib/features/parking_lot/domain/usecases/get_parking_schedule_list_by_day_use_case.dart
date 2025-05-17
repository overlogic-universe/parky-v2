import '../../../../core/utils/resource_state.dart';
import '../entities/parking_schedule_day_type.dart';
import '../entities/parking_schedule_entity.dart';
import '../repositories/parking_schedule_repository.dart';

class GetParkingScheduleListByDayUseCase {
  final ParkingScheduleRepository repository;

  const GetParkingScheduleListByDayUseCase({required this.repository});

  Future<ResourceState<List<ParkingScheduleEntity>>> call({
    required WeekDay day,
  }) async => await repository.getParkingScheduleListByDay(day);
}
