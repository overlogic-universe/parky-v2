import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/parking_lot_schedule_entity.dart';
import '../../domain/entities/parking_schedule_day_type.dart';

part 'parking_lot_state.freezed.dart';

@freezed
abstract class ParkingLotState with _$ParkingLotState {
  const factory ParkingLotState({
    required Map<WeekDay, List<ParkingLotScheduleEntity>> parkingLotScheduleMap,
  }) = _ParkingLotState;
}
