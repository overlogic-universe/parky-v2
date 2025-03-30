import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/styles/colors/theme_color.dart';
import 'theme_state.dart';

part 'theme_view_model.g.dart';

@riverpod
class ThemeViewModel extends _$ThemeViewModel {
  @override
  ThemeState build() => ThemeState(themeModeType: ThemeModeType.main);
  
  Future<void> setTheme(String theme) async {
    state = state.copyWith(themeModeType: _getThemeMode(theme));
  }

  ThemeModeType _getThemeMode(String theme) {
    switch (theme) {
      case 'main':
        return ThemeModeType.main;
      case 'mainDark':
        return ThemeModeType.mainDark;
      default:
        return ThemeModeType.main;
    }
  }
}
