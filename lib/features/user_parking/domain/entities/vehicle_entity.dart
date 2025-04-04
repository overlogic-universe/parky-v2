import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_entity.freezed.dart';

@freezed
abstract class VehicleEntity with _$VehicleEntity {
  const factory VehicleEntity({
    required String id,
    required String plate,
    required String userId,
  }) = _VehicleEntity;
}
