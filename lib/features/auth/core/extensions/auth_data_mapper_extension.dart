import '../../data/models/user_model.dart';
import '../../domain/entities/user_entity.dart';

extension UserModelToEntity on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      studentId: studentId,
      name: name,
      email: email,
      password: password,
    );
  }
}

extension UserEntityToModel on UserEntity {
  UserModel toModel() {
    return UserModel(
      id: id,
      studentId: studentId,
      name: name,
      email: email,
      password: password,
    );
  }
}
