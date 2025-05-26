import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/models/student_model.dart';
import '../../domain/entities/student_entity.dart';

extension StudentModelToEntity on StudentModel {
  StudentEntity toEntity() {
    return StudentEntity(
      id: id,
      nim: nim,
      name: name,
      qrCodeId: qrCodeId,
      email: email,
      password: password,
      createdAt: createdAt?.toDate(),
      updatedAt: updatedAt?.toDate(),
    );
  }
}

extension StudentEntityToModel on StudentEntity {
  StudentModel toModel() {
    return StudentModel(
      id: id,
      nim: nim,
      qrCodeId: qrCodeId,
      name: name,
      email: email,
      password: password,
      createdAt: createdAt != null ? Timestamp.fromDate(createdAt!) : null,
      updatedAt: updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
    );
  }
}
