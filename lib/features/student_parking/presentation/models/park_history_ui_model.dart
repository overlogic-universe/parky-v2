import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/park_status.dart';

part 'park_history_ui_model.freezed.dart';

@freezed
abstract class ParkingHistoryUiModel with _$ParkingHistoryUiModel {
  const factory ParkingHistoryUiModel({
    required String id,
    required ParkStatus? status,
    required String? lastActivityTime,
    required String? lastActivityDay,
    required DateTime? createdAt,
    required DateTime? updatedAt,
  }) = _ParkingHistoryUiModel;
}
