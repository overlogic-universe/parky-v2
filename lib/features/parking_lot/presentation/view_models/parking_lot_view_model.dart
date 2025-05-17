import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/di/parking_lot_provider.dart';
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
    state = AsyncData(await _getAllParkingScheduleList());
  }

  Future<void> refreshMonday() async {
    final list = await getParkingScheduleListByDayUseCase(day: WeekDay.monday);
    final currentState = state.value ?? const ParkingLotState();
    state = AsyncData(currentState.copyWith(mondayParkingScheduleList: list));
  }

  Future<void> refreshTuesday() async {
    final list = await getParkingScheduleListByDayUseCase(day: WeekDay.tuesday);
    final currentState = state.value ?? const ParkingLotState();
    state = AsyncData(currentState.copyWith(tuesdayParkingScheduleList: list));
  }

  Future<void> refreshWednesday() async {
    final list = await getParkingScheduleListByDayUseCase(
      day: WeekDay.wednesday,
    );
    final currentState = state.value ?? const ParkingLotState();
    state = AsyncData(
      currentState.copyWith(wednesdayParkingScheduleList: list),
    );
  }

  Future<void> refreshThursday() async {
    final list = await getParkingScheduleListByDayUseCase(
      day: WeekDay.thursday,
    );
    final currentState = state.value ?? const ParkingLotState();
    state = AsyncData(currentState.copyWith(thursdayParkingScheduleList: list));
  }

  Future<void> refreshFriday() async {
    final list = await getParkingScheduleListByDayUseCase(day: WeekDay.friday);
    final currentState = state.value ?? const ParkingLotState();
    state = AsyncData(currentState.copyWith(fridayParkingScheduleList: list));
  }

  Future<void> refreshSaturday() async {
    final list = await getParkingScheduleListByDayUseCase(
      day: WeekDay.saturday,
    );
    final currentState = state.value ?? const ParkingLotState();
    state = AsyncData(currentState.copyWith(saturdayParkingScheduleList: list));
  }

  Future<void> refreshSunday() async {
    final list = await getParkingScheduleListByDayUseCase(day: WeekDay.sunday);
    final currentState = state.value ?? const ParkingLotState();
    state = AsyncData(currentState.copyWith(sundayParkingScheduleList: list));
  }

  Future<ParkingLotState> _getAllParkingScheduleList() async {
    try {
      final mondayList = await getParkingScheduleListByDayUseCase(
        day: WeekDay.monday,
      );
      final tuesdayList = await getParkingScheduleListByDayUseCase(
        day: WeekDay.tuesday,
      );
      final wednesdayList = await getParkingScheduleListByDayUseCase(
        day: WeekDay.wednesday,
      );
      final thursdayList = await getParkingScheduleListByDayUseCase(
        day: WeekDay.thursday,
      );
      final fridayList = await getParkingScheduleListByDayUseCase(
        day: WeekDay.friday,
      );
      final saturdayList = await getParkingScheduleListByDayUseCase(
        day: WeekDay.saturday,
      );
      final sundayList = await getParkingScheduleListByDayUseCase(
        day: WeekDay.sunday,
      );

      return ParkingLotState(
        mondayParkingScheduleList: mondayList,
        tuesdayParkingScheduleList: tuesdayList,
        wednesdayParkingScheduleList: wednesdayList,
        thursdayParkingScheduleList: thursdayList,
        fridayParkingScheduleList: fridayList,
        saturdayParkingScheduleList: saturdayList,
        sundayParkingScheduleList: sundayList,
      );
    } catch (e, st) {
      state = AsyncError(e, st);
      return const ParkingLotState();
    }
  }
}
