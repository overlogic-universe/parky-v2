import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/setting_entity.dart';

import '../../../../core/styles/colors/theme_color.dart';

part 'setting_model.freezed.dart';
part 'setting_model.g.dart';

@freezed
abstract class SettingModel with _$SettingModel {
  const factory SettingModel({
    required ThemeModeType themeMode,
    required String languageCode,
  }) = _SettingModel;

  factory SettingModel.fromJson(Map<String, dynamic> json) =>
      _$SettingModelFromJson(json);

  factory SettingModel.fromEntity(SettingEntity entity) {
    return SettingModel(
      themeMode: entity.themeMode,
      languageCode: entity.languageCode,
    );
  }
}

extension SettingModelX on SettingModel {
  SettingEntity toEntity() {
    return SettingEntity(themeMode: themeMode, languageCode: languageCode);
  }
}
