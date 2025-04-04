import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/di/auth_provider.dart';
import '../../core/extensions/auth_data_mapper_extension.dart';
import '../../domain/entities/login_with_email_password_request.dart';
import '../../domain/usecases/get_user_entity_use_case.dart';
import '../../domain/usecases/login_with_email_and_password_use_case.dart';
import '../../domain/usecases/login_with_google_use_case.dart';
import '../../domain/usecases/sign_out_use_case.dart';
import 'login_state.dart';

part 'login_view_model.g.dart';

@riverpod
class LoginViewModel extends _$LoginViewModel {
  late final GetUserEntityUseCase _getUserEntityUseCase;
  late final LoginWithEmailAndPasswordUseCase _loginWithEmailAndPasswordUseCase;
  late final LoginWithGoogleUseCase _loginWithGoogleUseCase;
  late final SignOutUseCase _signOutUseCase;

  @override
  LoginState build() {
    _getUserEntityUseCase = ref.watch(getUserEntityUseCaseProvider);
    _loginWithEmailAndPasswordUseCase = ref.watch(
      loginWithEmailAndPasswordUseCaseProvider,
    );
    _loginWithGoogleUseCase = ref.watch(loginWithGoogleUseCaseProvider);
    _signOutUseCase = ref.watch(signOutUseCaseProvider);

    return const LoginState(userUiModel: AsyncValue.data(null));
  }

  Future<void> loginWithEmailAndPassword({
    required LoginWithEmailPasswordRequest loginWithEmailPasswordRequest,
  }) async {
    state = state.copyWith(userUiModel: const AsyncLoading());
    try {
      final user = await _loginWithEmailAndPasswordUseCase(
        params: loginWithEmailPasswordRequest,
      );
      state = state.copyWith(userUiModel: AsyncData(user.toUiModel()));
    } catch (e, st) {
      state = state.copyWith(userUiModel: AsyncError(e, st));
    }
  }

  Future<void> loginWithGoogle() async {
    state = state.copyWith(userUiModel: const AsyncLoading());
    try {
      final user = await _loginWithGoogleUseCase();
      state = state.copyWith(userUiModel: AsyncData(user.toUiModel()));
    } catch (e, st) {
      state = state.copyWith(userUiModel: AsyncError(e, st));
    }
  }

  Future<void> getUserEntity() async {
    state = state.copyWith(userUiModel: const AsyncLoading());
    try {
      final user = await _getUserEntityUseCase();
      if (user.data == null) return;
      state = state.copyWith(userUiModel: AsyncData(user.data!.toUiModel()));
    } catch (e, st) {
      state = state.copyWith(userUiModel: AsyncError(e, st));
    }
  }

  Future<void> signOut() async {
    state = state.copyWith(userUiModel: const AsyncLoading());
    try {
      await _signOutUseCase();
      state = state.copyWith(userUiModel: const AsyncData(null));
    } catch (e, st) {
      state = state.copyWith(userUiModel: AsyncError(e, st));
    }
  }
}
