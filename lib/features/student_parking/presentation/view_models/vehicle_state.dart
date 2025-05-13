import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/vehicle_entity.dart';

part 'vehicle_state.freezed.dart';

@freezed
abstract class VehicleState with _$VehicleState {
  const factory VehicleState({
    @Default(null) VehicleEntity? vehicle,
  }) = _VehicleState;
}
