import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_entity.freezed.dart';

@freezed
abstract class AuthEntity with _$AuthEntity {
  const factory AuthEntity({
    required String id,
    required String username,
    required String email,
    @Default(null) String? password,
  }) = _AuthEntity;
}
