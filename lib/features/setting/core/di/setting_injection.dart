import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/datasources/local/setting_local_data_source.dart';
import '../../data/datasources/local/setting_local_data_source_impl.dart';
import '../../data/repositories/setting_repository_impl.dart';
import '../../domain/repositories/setting_repository.dart';
import '../../domain/usecases/get_language_use_case.dart';
import '../../domain/usecases/get_theme_use_case.dart';
import '../../domain/usecases/save_language_use_case.dart';
import '../../domain/usecases/save_theme_use_case.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
);

final settingLocalDataSourceProvider = Provider<SettingLocalDataSource>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);

  return SettingLocalDataSourceImpl(sharedPreferences: sharedPreferences);
});

final settingRepositoryProvider = Provider<SettingRepository>((ref) {
  final settingLocalDataSource = ref.watch(settingLocalDataSourceProvider);
  return SettingRepositoryImpl(settingLocalDataSource: settingLocalDataSource);
});

final getLanguageUseCaseProvider = Provider<GetLanguageUseCase>((ref) {
  final repository = ref.watch(settingRepositoryProvider);
  return GetLanguageUseCase(repository: repository);
});

final saveLanguageUseCaseProvider = Provider<SaveLanguageUseCase>((ref) {
  final repository = ref.watch(settingRepositoryProvider);
  return SaveLanguageUseCase(repository: repository);
});

final getThemeUseCaseProvider = Provider<GetThemeUseCase>((ref) {
  final repository = ref.watch(settingRepositoryProvider);
  return GetThemeUseCase(repository: repository);
});

final saveThemeUseCaseProvider = Provider<SaveThemeUseCase>((ref) {
  final repository = ref.watch(settingRepositoryProvider);
  return SaveThemeUseCase(repository: repository);
});
