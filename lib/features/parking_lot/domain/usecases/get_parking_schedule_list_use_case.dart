import '../entities/parking_schedule_day_type.dart';
import '../entities/parking_schedule_list_entity.dart';
import '../repositories/parking_lot_has_parking_schedule_repository.dart';
import '../repositories/parking_lot_repository.dart';
import '../repositories/parking_schedule_repository.dart';

class GetParkingScheduleListByDayUseCase {
  final ParkingLotRepository parkingLotRepository;
  final ParkingScheduleRepository parkingScheduleRepository;
  final ParkingLotHasParkingScheduleRepository
  parkingLotHasParkingScheduleRepository;

  const GetParkingScheduleListByDayUseCase({
    required this.parkingLotRepository,
    required this.parkingScheduleRepository,
    required this.parkingLotHasParkingScheduleRepository,
  });

  Future<List<ParkingScheduleListEntity>> call({required WeekDay day}) async {
    // Step 1: Ambil daftar jadwal parkir berdasarkan hari
    final parkingScheduleListResult = await parkingScheduleRepository
        .getParkingScheduleListByDay(day);

    final parkingScheduleList = parkingScheduleListResult.data;
    if (parkingScheduleList == null || parkingScheduleList.isEmpty) {
      // TODO: ADD EXCEPTION
      return [];
    }

    // Step 2: Ambil data relasi antara jadwal dan tempat parkir
    final hasParkingScheduleListResult =
        await parkingLotHasParkingScheduleRepository
            .getParkingLotHasParkingScheduleListByScheduleIds(
              parkingScheduleList,
            );

    final hasParkingScheduleList = hasParkingScheduleListResult.data;
    if (hasParkingScheduleList == null || hasParkingScheduleList.isEmpty) {
      // TODO: ADD EXCEPTION

      return [];
    }

    // Step 3: Ambil daftar tempat parkir dari relasi tersebut
    final parkingLotList = await parkingLotRepository
        .getParkingLotListByParkingLotHasParkingScheduleId(
          hasParkingScheduleList,
        );

    // Step 4: Cocokkan dan gabungkan menjadi ParkingScheduleListEntity
    final result = <ParkingScheduleListEntity>[];

    for (final rel in hasParkingScheduleList) {
      final parkingLot = parkingLotList.data!.firstWhere(
        (lot) => lot.id == rel.parkingLotId,
      );

      final schedule = parkingScheduleList.firstWhere(
        (sch) => sch.id == rel.parkingScheduleId,
      );

      result.add(
        ParkingScheduleListEntity(
          parkingLot: parkingLot,
          parkingSchedule: schedule,
        ),
      );
    }

    return result;
  }
}
