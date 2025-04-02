// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SettingModel _$SettingModelFromJson(Map<String, dynamic> json) =>
    _SettingModel(
      themeMode: $enumDecode(_$ThemeModeTypeEnumMap, json['themeMode']),
      languageCode: json['languageCode'] as String,
    );

Map<String, dynamic> _$SettingModelToJson(_SettingModel instance) =>
    <String, dynamic>{
      'themeMode': _$ThemeModeTypeEnumMap[instance.themeMode]!,
      'languageCode': instance.languageCode,
    };

const _$ThemeModeTypeEnumMap = {
  ThemeModeType.main: 'main',
  ThemeModeType.orb: 'orb',
};
