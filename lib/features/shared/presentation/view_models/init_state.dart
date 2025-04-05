import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/presentation/models/user_ui_model.dart';

part 'init_state.freezed.dart';

@freezed
abstract class InitState with _$InitState {
  const factory InitState({
    @Default(AsyncValue<bool>.data(false)) AsyncValue<bool> isLogin,
    @Default(AsyncValue<UserUiModel?>.data(null))
    AsyncValue<UserUiModel?> userUiModel,
  }) = _InitState;
}
