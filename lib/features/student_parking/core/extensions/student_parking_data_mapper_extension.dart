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
      parkedAt: parkedAt,
      exitedAt: exitedAt,
    );
  }
}

extension ParkingHistoryEntityToModel on ParkingHistoryEntity {
  ParkingHistoryModel toModel() {
    return ParkingHistoryModel(
      id: id,
      status: status?.value,
      parkedAt: parkedAt,
      exitedAt: exitedAt,
    );
  }
}

extension VehicleModelToEntity on VehicleModel {
  VehicleEntity toEntity() {
    return VehicleEntity(id: id, plate: plate, studentId: studentId);
  }
}

extension VehicleEntityToModel on VehicleEntity {
  VehicleModel toModel() {
    return VehicleModel(id: id, plate: plate, studentId: studentId);
  }
}

extension ParkingHistoryEntityToParkingHistoryUiModel on ParkingHistoryEntity {
  ParkingHistoryUiModel toUiModel() {
    final parkedAtFormatted = parkedAt?.toDate();
    final exitedAtFormatted = exitedAt?.toDate();
    final lastActivity =
        status == ParkStatus.parked ? parkedAtFormatted : exitedAtFormatted;

    return ParkingHistoryUiModel(
      id: id,
      lastActivityTime: DateTimeUtil.formatTimeWIB(lastActivity),
      lastActivityDay: DateTimeUtil.formatDayID(lastActivity),
      status: status,
    );
  }
}
