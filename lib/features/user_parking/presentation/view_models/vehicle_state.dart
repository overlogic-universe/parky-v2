import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/vehicle_ui_model.dart';

part 'vehicle_state.freezed.dart';

@freezed
abstract class VehicleState with _$VehicleState {
  const factory VehicleState({
    @Default(null) VehicleUiModel? vehicleUiModel,
  }) = _VehicleState;
}
