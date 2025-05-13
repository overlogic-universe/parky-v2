import 'package:intl/intl.dart';

import '../../data/models/park_model.dart';
import '../../data/models/vehicle_mode.dart';
import '../../domain/entities/park_entity.dart';
import '../../domain/entities/vehicle_entity.dart';
import '../../presentation/models/park_ui_model.dart';

extension ParkModelToEntity on ParkModel {
  ParkEntity toEntity() {
    return ParkEntity(
      id: id,
      lastActivity: lastActivity,
      status: status,
      studentId: studentId,
    );
  }
}

extension ParkEntityToModel on ParkEntity {
  ParkModel toModel() {
    return ParkModel(
      id: id,
      lastActivity: lastActivity,
      status: status,
      studentId: studentId,
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

extension ParkEntityToParkUiModel on ParkEntity {
  ParkUiModel toUiModel() {
    final dateTime = lastActivity.toDate();
    final formattedLastActivityTime =
        "${DateFormat('HH:mm', 'id_ID').format(dateTime)} WIB";
    final formattedLastActivityDay = DateFormat(
      'd MMM yyyy',
      'id_ID',
    ).format(dateTime);

    return ParkUiModel(
      id: id,
      lastActivityTime: formattedLastActivityTime,
      lastActivityDay: formattedLastActivityDay,
      status: status,
      studentId: studentId,
    );
  }
}

