import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/di/auth_provider.dart';
import '../../domain/entities/login_with_email_password_request.dart';
import '../../domain/usecases/login_with_email_and_password_use_case.dart';
import '../../domain/usecases/login_with_google_use_case.dart';
import '../../domain/usecases/sign_out_use_case.dart';
import 'login_state.dart';

part 'login_view_model.g.dart';

@riverpod
class LoginViewModel extends _$LoginViewModel {
  late final LoginWithEmailAndPasswordUseCase _loginWithEmailAndPasswordUseCase;
  late final LoginWithGoogleUseCase _loginWithGoogleUseCase;
  late final SignOutUseCase _signOutUseCase;

  @override
  LoginState build() {
    _loginWithEmailAndPasswordUseCase = ref.watch(
      loginWithEmailAndPasswordUseCaseProvider,
    );
    _loginWithGoogleUseCase = ref.watch(loginWithGoogleUseCaseProvider);
    _signOutUseCase = ref.watch(signOutUseCaseProvider);

    return const LoginState(student: AsyncValue.data(null));
  }

  Future<void> loginWithEmailAndPassword({
    required LoginWithEmailPasswordRequest loginWithEmailPasswordRequest,
  }) async {
    state = state.copyWith(student: const AsyncLoading());
    try {
      final student = await _loginWithEmailAndPasswordUseCase(
        params: loginWithEmailPasswordRequest,
      );
      state = state.copyWith(student: AsyncData(student));
    } catch (e, st) {
      state = state.copyWith(student: AsyncError(e, st));
    }
  }

  Future<void> loginWithGoogle() async {
    state = state.copyWith(student: const AsyncLoading());
    try {
      final student = await _loginWithGoogleUseCase();
      state = state.copyWith(student: AsyncData(student));
    } catch (e, st) {
      state = state.copyWith(student: AsyncError(e, st));
    }
  }

  Future<void> signOut() async {
    state = state.copyWith(student: const AsyncLoading());
    try {
      await _signOutUseCase();
      state = state.copyWith(student: const AsyncData(null));
    } catch (e, st) {
      state = state.copyWith(student: AsyncError(e, st));
    }
  }
}
