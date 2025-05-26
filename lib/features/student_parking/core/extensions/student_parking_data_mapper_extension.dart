import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/utils/date_time_util.dart';
import '../../data/models/parking_history_model.dart';
import '../../data/models/vehicle_model.dart';
import '../../domain/entities/park_status.dart';
import '../../domain/entities/parking_history_entity.dart';
import '../../domain/entities/vehicle_entity.dart';
import '../../presentation/models/park_history_ui_model.dart';

extension ParkingHistoryModelToEntity on ParkingHistoryModel {
  ParkingHistoryEntity toEntity() {
    return ParkingHistoryEntity(
      id: id,
      status: ParkStatus.fromString(status),
      parkedAt: parkedAt?.toDate(),
      exitedAt: exitedAt?.toDate(),
      createdAt: createdAt?.toDate(),
      updatedAt: updatedAt?.toDate(),
    );
  }
}

extension ParkingHistoryEntityToModel on ParkingHistoryEntity {
  ParkingHistoryModel toModel() {
    return ParkingHistoryModel(
      id: id,
      status: status?.value,
      parkedAt: parkedAt != null ? Timestamp.fromDate(parkedAt!) : null,
      exitedAt: exitedAt != null ? Timestamp.fromDate(exitedAt!) : null,
      createdAt: createdAt != null ? Timestamp.fromDate(createdAt!) : null,
      updatedAt: updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
    );
  }
}

extension VehicleModelToEntity on VehicleModel {
  VehicleEntity toEntity() {
    return VehicleEntity(
      id: id,
      plate: plate,
      studentId: studentId,
      createdAt: createdAt?.toDate(),
      updatedAt: updatedAt?.toDate(),
    );
  }
}

extension VehicleEntityToModel on VehicleEntity {
  VehicleModel toModel() {
    return VehicleModel(
      id: id,
      plate: plate,
      studentId: studentId,
      createdAt: createdAt != null ? Timestamp.fromDate(createdAt!) : null,
      updatedAt: updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
    );
  }
}

extension ParkingHistoryEntityToParkingHistoryUiModel on ParkingHistoryEntity {
  ParkingHistoryUiModel toUiModel() {
    final lastActivity = status == ParkStatus.parked ? parkedAt : exitedAt;

    return ParkingHistoryUiModel(
      id: id,
      lastActivityTime: DateTimeUtil.formatTimeWIB(lastActivity),
      lastActivityDay: DateTimeUtil.formatDayID(lastActivity),
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
