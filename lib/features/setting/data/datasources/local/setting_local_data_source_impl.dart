import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/constants/common/locale_id_constant.dart';
import '../../../../../core/styles/colors/theme_color.dart';
import 'setting_local_data_source.dart';

class SettingLocalDataSourceImpl implements SettingLocalDataSource {
  final SharedPreferences sharedPreferences;

  const SettingLocalDataSourceImpl({required this.sharedPreferences});

  static const String _themeKey = 'theme_mode';
  static const String _languageKey = 'language_code';

  @override
  String getLanguage() {
    final languageCode =
        sharedPreferences.getString(_languageKey) ?? LocaleIdConstant.ID;
    return languageCode;
  }

  @override
  String getTheme() {
    final theme =
        sharedPreferences.getString(_themeKey) ?? ThemeModeType.main.name;
    return theme;
  }

  @override
  Future<void> saveLanguage(String languageId) async {
    await sharedPreferences.setString(_languageKey, languageId);
  }

  @override
  Future<void> saveTheme(String theme) async {
    await sharedPreferences.setString(_themeKey, theme);
  }
}
