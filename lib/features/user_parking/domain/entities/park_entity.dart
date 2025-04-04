import 'package:freezed_annotation/freezed_annotation.dart';

part 'park_entity.freezed.dart';

@freezed
abstract class ParkEntity with _$ParkEntity {
  const factory ParkEntity({
    required String id,
    required ParkStatus status,
    required String lastActivity,
    required String userId,
  }) = _ParkEntity;
}

enum ParkStatus { parking, parked }
