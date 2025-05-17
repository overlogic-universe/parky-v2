import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../parking_lot/domain/entities/parking_lot_entity.dart';
import '../models/park_history_ui_model.dart';

part 'park_state.freezed.dart';

@freezed
abstract class ParkState with _$ParkState {
  const factory ParkState({
    @Default(null) ParkingHistoryUiModel? currentParkingHistory,
    @Default(null) ParkingLotEntity? currentParkingLot,
  }) = _ParkState;
}
