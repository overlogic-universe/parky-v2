import '../../../../core/utils/resource_state.dart';
import '../entities/parking_lot_has_parking_schedule_entity.dart';
import '../entities/parking_schedule_entity.dart';
import '../repositories/parking_lot_has_parking_schedule_repository.dart';

class GetParkingLotHasParkingScheduleListByScheduleIdsUseCase {
  final ParkingLotHasParkingScheduleRepository repository;

  const GetParkingLotHasParkingScheduleListByScheduleIdsUseCase({
    required this.repository,
  });

  Future<ResourceState<List<ParkingLotHasParkingScheduleEntity>>> call({
    required List<ParkingScheduleEntity> parkingScheduleList,
  }) async => await repository.getParkingLotHasParkingScheduleListByScheduleIds(
    parkingScheduleList,
  );
}
