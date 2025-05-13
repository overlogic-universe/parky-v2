import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_entity.freezed.dart';

@freezed
abstract class StudentEntity with _$StudentEntity {
  const factory StudentEntity({
    required String id,
    required String nim,
    required String name,
    required String email,
    @Default(null) String? password,
  }) = _StudentEntity;
}
