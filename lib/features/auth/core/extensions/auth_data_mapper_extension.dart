import '../../data/models/user_model.dart';
import '../../domain/entities/user_entity.dart';
import '../../presentation/models/user_ui_model.dart';

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

extension UserEntityToUserUiModel on UserEntity {
  UserUiModel toUiModel() {
    return UserUiModel(
      id: id,
      studentId: studentId,
      name: name,
      email: email,
    );
  }
}
