import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/provider.dart';
import '../../../auth/core/di/auth_provider.dart';
import '../../../auth/domain/usecases/is_login_use_case.dart';

part 'init_view_model.g.dart';

@Riverpod(keepAlive: true)
class InitViewModel extends _$InitViewModel {
  late final IsLoginUseCase _isLoginUseCase;

  @override
  Future<bool> build() async=>await _isLogin();

  Future<bool> _isLogin() async {
    try {
    state = AsyncLoading();
      final firebaseAuth = ref.read(firebaseAuthProvider);
      _isLoginUseCase = ref.read(isLoginUseCaseProvider);
      final user = firebaseAuth.currentUser;
      if (user == null) {
        state = AsyncData(false);
        return false;
      }
      final isLoginValue = await _isLoginUseCase.call();
      final isLogin = isLoginValue == user.uid;
      state = AsyncData(isLogin);
      return isLogin;
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }
}
