import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/provider.dart';
import '../../../auth/core/di/auth_provider.dart';
import '../../../auth/domain/usecases/get_sttudent_entity_use_case.dart';
import '../../../auth/domain/usecases/is_login_use_case.dart';
import 'init_state.dart';

part 'init_view_model.g.dart';

@Riverpod(keepAlive: true)
class InitViewModel extends _$InitViewModel {
  late final IsLoginUseCase _isLoginUseCase;
  late final GetStudentEntityUseCase _getStudentEntityUseCase;

  @override
  FutureOr<InitState> build() async {
    _isLoginUseCase = ref.read(isLoginUseCaseProvider);
    _getStudentEntityUseCase = ref.read(getStudentEntityUseCaseProvider);
    return _checkLoginStatus();
  }

  Future<InitState> _checkLoginStatus() async {
    try {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      final student = firebaseAuth.currentUser;

      if (student == null) {
        return const InitState(isLogin: false, student: null);
      }

      final isLoginValue = await _isLoginUseCase();
      final isLogin = isLoginValue == student.uid;

      return InitState(isLogin: isLogin, student: null);
    } catch (e, st) {
      throw AsyncError(e, st);
    }
  }

  Future<void> getStudentEntity() async {
    final currentState = state.asData?.value;
    if (currentState == null) return;

    // Set state ke loading jika kamu ingin tampilkan indikator loading:
    state = const AsyncLoading();

    try {
      final student = await _getStudentEntityUseCase();
      if (student.data == null) {
        state = AsyncData(currentState.copyWith(student: null));
        return;
      }

      state = AsyncData(currentState.copyWith(student: student.data));
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
