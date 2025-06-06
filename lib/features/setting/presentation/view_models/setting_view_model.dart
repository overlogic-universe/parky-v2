import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/styles/colors/theme_color.dart';
import '../../../auth/core/di/auth_provider.dart';
import '../../../auth/domain/usecases/update_password_use_case.dart';
import '../../core/di/setting_provider.dart';
import '../../domain/usecases/get_language_use_case.dart';
import '../../domain/usecases/get_theme_use_case.dart';
import '../../domain/usecases/save_language_use_case.dart';
import '../../domain/usecases/save_theme_use_case.dart';
import 'setting_state.dart';

part 'setting_view_model.g.dart';

@riverpod
class SettingViewModel extends _$SettingViewModel {
  late final GetLanguageUseCase _getLanguageUseCase;
  late final SaveLanguageUseCase _saveLanguageUseCase;
  late final GetThemeUseCase _getThemeUseCase;
  late final SaveThemeUseCase _saveThemeUseCase;
  late final UpdatePasswordUseCase _updatePasswordUseCase;

  @override
  Future<SettingState> build() async {
    _getLanguageUseCase = ref.watch(getLanguageUseCaseProvider);
    _saveLanguageUseCase = ref.watch(saveLanguageUseCaseProvider);
    _getThemeUseCase = ref.watch(getThemeUseCaseProvider);
    _saveThemeUseCase = ref.watch(saveThemeUseCaseProvider);
    _updatePasswordUseCase = ref.watch(updatePasswordUseCaseProvider);

    return await _loadSettings();
  }

  Future<SettingState> _loadSettings() async {
    try {
      final themeStr = await _getThemeUseCase.call();
      final themeModeType = _mapStringToThemeModeType(themeStr);
      final localeId = await _getLanguageUseCase.call();

      return SettingState(themeModeType: themeModeType, localeId: localeId);
    } catch (e, stackTrace) {
      return AsyncValue.error(e, stackTrace).value ?? SettingState();
    }
  }

  Future<void> setTheme(ThemeModeType theme) async {
    state = AsyncValue.loading();
    try {
      await _saveThemeUseCase.call(params: theme.name);
      final currentState = state.value;
      if (currentState != null) {
        state = AsyncValue.data(currentState.copyWith(themeModeType: theme));
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> getTheme() async {
    state = AsyncValue.loading();
    try {
      final themeStr = await _getThemeUseCase.call();
      final themeModeType = _mapStringToThemeModeType(themeStr);
      state = AsyncValue.data(
        state.value!.copyWith(themeModeType: themeModeType),
      );
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> setLanguage(String localeId) async {
    state = AsyncValue.loading();
    try {
      await _saveLanguageUseCase.call(params: localeId);
      final currentState = state.value;
      if (currentState != null) {
        state = AsyncValue.data(currentState.copyWith(localeId: localeId));
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> getLanguage() async {
    state = AsyncValue.loading();
    try {
      final localeId = await _getLanguageUseCase.call();
      state = AsyncValue.data(state.value!.copyWith(localeId: localeId));
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  ThemeModeType _mapStringToThemeModeType(String themeStr) {
    return ThemeModeType.values.firstWhere(
      (theme) => theme.name == themeStr,
      orElse: () => ThemeModeType.main,
    );
  }

  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    state = AsyncValue.loading();

    try {
      await _updatePasswordUseCase(
        oldPassword: oldPassword,
        newPassword: newPassword,
      );
      state = AsyncValue.data(state.value!);
    } catch (e, stackTrace) {
      log("UPDATE PASSWORD ERROR: ${e}");
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
