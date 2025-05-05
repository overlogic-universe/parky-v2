import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/presentation/models/user_ui_model.dart';

part 'init_state.freezed.dart';

@freezed
abstract class InitState with _$InitState {
  const factory InitState({
    required bool isLogin,
    UserUiModel? userUiModel,
  }) = _InitState;
}
