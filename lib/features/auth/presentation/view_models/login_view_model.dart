import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utils/request_state.dart';
import 'login_state.dart';

part 'login_view_model.g.dart';

@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  LoginState build() =>
      LoginState(requestState: RequestState.initial);
}
