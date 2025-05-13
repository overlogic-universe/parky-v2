import '../../data/models/student_model.dart';
import '../../domain/entities/student_entity.dart';

extension StudentModelToEntity on StudentModel {
  StudentEntity toEntity() {
    return StudentEntity(
      id: id,
      nim: nim,
      name: name,
      email: email,
      password: password,
    );
  }
}

extension StudentEntityToModel on StudentEntity {
  StudentModel toModel() {
    return StudentModel(
      id: id,
      nim: nim,
      name: name,
      email: email,
      password: password,
    );
  }
}