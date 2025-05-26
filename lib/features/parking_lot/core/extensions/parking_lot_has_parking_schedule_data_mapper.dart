import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/models/parking_assignment.dart';
import '../../domain/entities/parking_assignment_entity.dart';

extension ParkingAssignmentToEntity on ParkingAssignmentModel {
  ParkingAssignmentEntity toEntity() {
    return ParkingAssignmentEntity(
      id: id,
      parkingLotId: parkingLotId,
      parkingScheduleId: parkingScheduleId,
      createdAt: createdAt?.toDate(),
      updatedAt: updatedAt?.toDate(),
    );
  }
}

extension ParkingAssignmentEntityToModel on ParkingAssignmentEntity {
  ParkingAssignmentModel toModel() {
    return ParkingAssignmentModel(
      id: id,
      parkingLotId: parkingLotId,
      parkingScheduleId: parkingScheduleId,
      createdAt: createdAt != null ? Timestamp.fromDate(createdAt!) : null,
      updatedAt: updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
    );
  }
}
