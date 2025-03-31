import 'dart:developer';

import '../../domain/repositories/setting_repository.dart';
import '../datasources/local/setting_local_data_source.dart';

class SettingRepositoryImpl implements SettingRepository {
  final SettingLocalDataSource settingLocalDataSource;

  SettingRepositoryImpl({required this.settingLocalDataSource});

  @override
  String getLanguage() {
    try {
      return settingLocalDataSource.getLanguage();
    } catch (e) {
      log("ERROR getLanguage: $e");
      throw Exception("Failed to get language: $e");
    }
  }

  @override
  String getTheme() {
    try {
      return settingLocalDataSource.getTheme();
    } catch (e) {
      log("ERROR getTheme: $e");
      throw Exception("Failed to get theme: $e");
    }
  }

  @override
  Future<void> saveLanguage(String localeId) async {
    try {
      await settingLocalDataSource.saveLanguage(localeId);
    } catch (e) {
      log("ERROR saveLanguage: $e");
      throw Exception("Failed to save language: $e");
    }
  }

  @override
  Future<void> saveTheme(String theme) async {
    try {
      await settingLocalDataSource.saveTheme(theme);
    } catch (e) {
      log("ERROR saveTheme: $e");
      throw Exception("Failed to save language: $e");
    }
  }
}
