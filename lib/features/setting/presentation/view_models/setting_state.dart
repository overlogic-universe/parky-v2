import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:parky/core/constants/common/locale_id_constant.dart';

import '../../../../core/styles/colors/theme_color.dart';

part 'setting_state.freezed.dart';

@freezed
abstract class SettingState with _$SettingState {
  const factory SettingState({
    @Default(ThemeModeType.main) ThemeModeType themeModeType,
    @Default(LocaleIdConstant.ID) String localeId,
  }) = _SettingState;
}
