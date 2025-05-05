import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/provider.dart';
import '../../../auth/core/di/auth_provider.dart';
import '../../../auth/core/extensions/auth_data_mapper_extension.dart';
import '../../../auth/domain/usecases/get_user_entity_use_case.dart';
import '../../../auth/domain/usecases/is_login_use_case.dart';
import 'init_state.dart';

part 'init_view_model.g.dart';

@Riverpod(keepAlive: true)
class InitViewModel extends _$InitViewModel {
  late final IsLoginUseCase _isLoginUseCase;
  late final GetUserEntityUseCase _getUserEntityUseCase;

  @override
  FutureOr<InitState> build() async {
    _isLoginUseCase = ref.read(isLoginUseCaseProvider);
    _getUserEntityUseCase = ref.read(getUserEntityUseCaseProvider);
    return _checkLoginStatus();
  }

  Future<InitState> _checkLoginStatus() async {
    try {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      final user = firebaseAuth.currentUser;

      if (user == null) {
        return const InitState(isLogin: false, userUiModel: null);
      }

      final isLoginValue = await _isLoginUseCase();
      final isLogin = isLoginValue == user.uid;

      return InitState(isLogin: isLogin, userUiModel: null);
    } catch (e, st) {
      throw AsyncError(e, st);
    }
  }

  Future<void> getUserEntity() async {
    final currentState = state.asData?.value;
    if (currentState == null) return;

    // Set state ke loading jika kamu ingin tampilkan indikator loading:
    state = const AsyncLoading();

    try {
      final user = await _getUserEntityUseCase();
      if (user.data == null) {
        state = AsyncData(currentState.copyWith(userUiModel: null));
        return;
      }

      state = AsyncData(
        currentState.copyWith(userUiModel: user.data!.toUiModel()),
      );
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
