import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/lang.dart';
import '../../domain/entities/park_entity.dart';

part 'park_ui_model.freezed.dart';

@freezed
abstract class ParkUiModel with _$ParkUiModel {
  const factory ParkUiModel({
    required String id,
    required ParkStatus status,
    required String lastActivityTime,
    required String lastActivityDay,
    required String studentId,
  }) = _ParkUiModel;
}

extension ParkStatusExtension on ParkStatus {
  String displayName(BuildContext context) {
    switch (this) {
      case ParkStatus.parked:
        return Lang.of(context).parked;
      case ParkStatus.parking:
        return Lang.of(context).parking;
    }
  }
}
