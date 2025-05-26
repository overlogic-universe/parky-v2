import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/di/parking_lot_provider.dart';
import '../../domain/entities/parking_lot_schedule_entity.dart';
import '../../domain/entities/parking_schedule_day_type.dart';
import '../../domain/usecases/get_parking_schedule_list_use_case.dart';
import 'parking_lot_state.dart';

part 'parking_lot_view_model.g.dart';

@Riverpod(keepAlive: true)
class ParkingLotViewModel extends _$ParkingLotViewModel {
  late final GetParkingScheduleListByDayUseCase
  getParkingScheduleListByDayUseCase;

  @override
  Future<ParkingLotState> build() async {
    getParkingScheduleListByDayUseCase = ref.watch(
      getParkingScheduleListByDayUseCaseProvider,
    );
    state = const AsyncLoading();
    final data = await _getAllParkingScheduleList();
    state = AsyncData(data);
    return data;
  }

  Future<void> refreshAll() async {
    state = const AsyncLoading();
    final refreshedData = await _getAllParkingScheduleList();
    state = AsyncData(refreshedData);
  }

  Future<ParkingLotState> _getAllParkingScheduleList() async {
    try {
      final parkingLotScheduleMap = <WeekDay, List<ParkingLotScheduleEntity>>{};

      for (final day in WeekDay.values) {
        final list = await getParkingScheduleListByDayUseCase(day: day);
        log("DATAAAAA: ${list}, ${day}");

        parkingLotScheduleMap[day] = list;
        log("DATAAAAA: ${parkingLotScheduleMap[day]}");
      }
      log(
        "Final Map: ${parkingLotScheduleMap.map((k, v) => MapEntry(k.name, v.toString()))}",
      );

      return ParkingLotState(parkingLotScheduleMap: parkingLotScheduleMap);
    } catch (e, st) {
      state = AsyncError(e, st);
      log("ERRRORRRRR: ${e}, STTTT: ${st}");
      return const ParkingLotState(parkingLotScheduleMap: {});
    }
  }
}
