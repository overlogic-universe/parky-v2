import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'park_entity.freezed.dart';

@freezed
abstract class ParkEntity with _$ParkEntity {
  const factory ParkEntity({
    required String id,
    required ParkStatus status,
    required Timestamp lastActivity,
    required String userId,
  }) = _ParkEntity;
}

enum ParkStatus { parking, parked }
