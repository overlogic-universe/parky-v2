abstract class SettingLocalDataSource {
  Future<void> saveTheme(String theme);
  Future<void> saveLanguage(String localeId);
  String getTheme();
  String getLanguage();
}
