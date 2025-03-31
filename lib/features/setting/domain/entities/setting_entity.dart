import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/styles/colors/theme_color.dart';

part 'setting_entity.freezed.dart';

@freezed
abstract class SettingEntity with _$SettingEntity {
  const factory SettingEntity({
    required ThemeModeType themeMode,
    required String languageCode,
  }) = _Setting;
}
