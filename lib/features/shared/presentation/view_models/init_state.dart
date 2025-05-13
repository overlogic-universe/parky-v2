import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/domain/entities/student_entity.dart';

part 'init_state.freezed.dart';

@freezed
abstract class InitState with _$InitState {
  const factory InitState({
    required bool isLogin,
    StudentEntity? student,
  }) = _InitState;
}
