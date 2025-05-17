import '../../../../core/utils/resource_state.dart';
import '../entities/parking_lot_entity.dart';
import '../entities/parking_lot_has_parking_schedule_entity.dart';
import '../repositories/parking_lot_repository.dart';

class GetParkingLotByParkingLotHasParkingScheduleIdUseCase {
  final ParkingLotRepository repository;

  const GetParkingLotByParkingLotHasParkingScheduleIdUseCase({
    required this.repository,
  });

  Future<ResourceState<List<ParkingLotEntity>>> call({
    required List<ParkingLotHasParkingScheduleEntity>
    parkingLotHasParkingScheduleList,
  }) async =>
      await repository.getParkingLotListByParkingLotHasParkingScheduleId(
        parkingLotHasParkingScheduleList,
      );
}
