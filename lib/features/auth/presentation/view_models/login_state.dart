import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/request_state.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    required RequestState requestState,
  }) = _LoginState;
}
