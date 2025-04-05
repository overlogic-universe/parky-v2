import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_ui_model.freezed.dart';

@freezed
abstract class VehicleUiModel with _$VehicleUiModel {
  const factory VehicleUiModel({
    required String id,
    required String plate,
    required String userId,
  }) = _VehicleUiModel;
}
