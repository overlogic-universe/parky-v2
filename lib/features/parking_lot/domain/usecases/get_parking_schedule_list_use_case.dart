import 'dart:developer';

import '../../core/extensions/parking_lot_has_parking_schedule_data_mapper.dart';

import '../../core/extensions/parking_lot_data_mapper_extension.dart';
import '../../core/extensions/parking_schedule_data_mapper.dart';
import '../entities/parking_lot_schedule_entity.dart';
import '../entities/parking_schedule_day_type.dart';
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

  Future<List<ParkingLotScheduleEntity>> call({required WeekDay day}) async {
    // Step 1: Ambil daftar jadwal parkir berdasarkan hari
    final parkingScheduleListResult = await parkingScheduleRepository
        .getParkingScheduleListByDay(day);
    final parkingScheduleList = parkingScheduleListResult.data;

    if (parkingScheduleList == null || parkingScheduleList.isEmpty) {
      log("parkingScheduleListResult null/empty");

      // TODO: ADD EXCEPTION
      return [];
    }

    for (var i in parkingScheduleList) {
      log("parkingScheduleListResult ${i.toModel()}");
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
      log("hasParkingScheduleList null/empty");

      return [];
    }
    for (var i in hasParkingScheduleList) {
      log("hasParkingScheduleList ${i.toModel()}");
    }

    // Step 3: Ambil daftar tempat parkir dari relasi tersebut
    final parkingLotList = await parkingLotRepository
        .getParkingLotListByParkingLotHasParkingScheduleId(
          hasParkingScheduleList,
        );

    // Step 4: Cocokkan dan gabungkan menjadi ParkingLotScheduleEntity
    final result = <ParkingLotScheduleEntity>[];

    for (final rel in hasParkingScheduleList) {
      final parkingLot = parkingLotList.data!.firstWhere(
        (lot) => lot.id == rel.parkingLotId,
      );

      final schedule = parkingScheduleList.firstWhere(
        (sch) => sch.id == rel.parkingScheduleId,
      );
      for (var i in result) {
        log("result parkingLot ${i.parkingLot.toModel()}");
        log("result parkingSchedule ${i.parkingSchedule.toModel()}");
      }

      result.add(
        ParkingLotScheduleEntity(
          parkingLot: parkingLot,
          parkingSchedule: schedule,
        ),
      );
    }

    return result;
  }
}
