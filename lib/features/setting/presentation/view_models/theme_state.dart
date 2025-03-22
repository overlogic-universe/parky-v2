import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/styles/colors/theme_color.dart';

part 'theme_state.freezed.dart';

@freezed
abstract class ThemeState with _$ThemeState {
  const factory ThemeState({required ThemeModeType themeModeType}) =
      _ThemeState;
}
