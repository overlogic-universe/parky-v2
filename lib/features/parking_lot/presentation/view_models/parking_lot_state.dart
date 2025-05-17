import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/parking_lot_schedule_entity.dart';

part 'parking_lot_state.freezed.dart';

@freezed
abstract class ParkingLotState with _$ParkingLotState {
  const factory ParkingLotState({
    @Default([]) List<ParkingLotScheduleEntity> mondayParkingScheduleList,
    @Default([]) List<ParkingLotScheduleEntity> tuesdayParkingScheduleList,
    @Default([]) List<ParkingLotScheduleEntity> wednesdayParkingScheduleList,
    @Default([]) List<ParkingLotScheduleEntity> thursdayParkingScheduleList,
    @Default([]) List<ParkingLotScheduleEntity> fridayParkingScheduleList,
    @Default([]) List<ParkingLotScheduleEntity> saturdayParkingScheduleList,
    @Default([]) List<ParkingLotScheduleEntity> sundayParkingScheduleList,
  }) = _ParkingLotState;
}
