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
  Future<InitState> build() async {
    _isLoginUseCase = ref.read(isLoginUseCaseProvider);
    _getUserEntityUseCase = ref.read(getUserEntityUseCaseProvider);
    return await _checkLoginStatus();
  }

  Future<InitState> _checkLoginStatus() async {
    final currentState =
        state.value ??
        const InitState(
          isLogin: AsyncData(false),
          userUiModel: AsyncData(null),
        );

    state = AsyncData(currentState.copyWith(isLogin: const AsyncLoading()));

    try {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      final user = firebaseAuth.currentUser;

      if (user == null) {
        return const InitState(
          isLogin: AsyncData(false),
          userUiModel: AsyncData(null),
        );
      }

      final isLoginValue = await _isLoginUseCase.call();
      final isLogin = isLoginValue == user.uid;

      return InitState(
        isLogin: AsyncData(isLogin),
        userUiModel: AsyncData(null),
      );
    } catch (e, st) {
      state = AsyncError(e, st);
      return const InitState(
        isLogin: AsyncData(false),
        userUiModel: AsyncData(null),
      );
    }
  }

  Future<void> getUserEntity() async {
    final currentState =
        state.value ??
        const InitState(
          isLogin: AsyncData(false),
          userUiModel: AsyncData(null),
        );

    state = AsyncData(currentState.copyWith(userUiModel: const AsyncLoading()));

    try {
      final user = await _getUserEntityUseCase();
      if (user.data == null) return;

      state = AsyncData(
        currentState.copyWith(userUiModel: AsyncData(user.data!.toUiModel())),
      );
    } catch (e, st) {
      state = AsyncData(currentState.copyWith(userUiModel: AsyncError(e, st)));
    }
  }
}
