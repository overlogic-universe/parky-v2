import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/park_ui_model.dart';

part 'park_state.freezed.dart';

@freezed
abstract class ParkState with _$ParkState {
  const factory ParkState({
    @Default(null) ParkingHistoryUiModel? parkingHistoryUiModel,
  }) = _ParkState;
}
