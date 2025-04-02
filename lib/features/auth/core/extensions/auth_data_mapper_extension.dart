import '../../data/models/auth_model.dart';
import '../../domain/entities/auth_entity.dart';

extension AuthModelToEntity on AuthModel {
  AuthEntity toEntity() {
    return AuthEntity(
      id: id,
      username: username,
      email: email,
      password: password,
    );
  }
}

extension AuthEntityToModel on AuthEntity {
  AuthModel toModel() {
    return AuthModel(
      id: id,
      username: username,
      email: email,
      password: password,
    );
  }
}
