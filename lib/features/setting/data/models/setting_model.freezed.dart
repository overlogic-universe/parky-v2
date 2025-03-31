// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingModel {

 ThemeModeType get themeMode; String get languageCode;
/// Create a copy of SettingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingModelCopyWith<SettingModel> get copyWith => _$SettingModelCopyWithImpl<SettingModel>(this as SettingModel, _$identity);

  /// Serializes this SettingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingModel&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,themeMode,languageCode);

@override
String toString() {
  return 'SettingModel(themeMode: $themeMode, languageCode: $languageCode)';
}


}

/// @nodoc
abstract mixin class $SettingModelCopyWith<$Res>  {
  factory $SettingModelCopyWith(SettingModel value, $Res Function(SettingModel) _then) = _$SettingModelCopyWithImpl;
@useResult
$Res call({
 ThemeModeType themeMode, String languageCode
});




}
/// @nodoc
class _$SettingModelCopyWithImpl<$Res>
    implements $SettingModelCopyWith<$Res> {
  _$SettingModelCopyWithImpl(this._self, this._then);

  final SettingModel _self;
  final $Res Function(SettingModel) _then;

/// Create a copy of SettingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? themeMode = null,Object? languageCode = null,}) {
  return _then(_self.copyWith(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeModeType,languageCode: null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SettingModel implements SettingModel {
  const _SettingModel({required this.themeMode, required this.languageCode});
  factory _SettingModel.fromJson(Map<String, dynamic> json) => _$SettingModelFromJson(json);

@override final  ThemeModeType themeMode;
@override final  String languageCode;

/// Create a copy of SettingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingModelCopyWith<_SettingModel> get copyWith => __$SettingModelCopyWithImpl<_SettingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SettingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingModel&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,themeMode,languageCode);

@override
String toString() {
  return 'SettingModel(themeMode: $themeMode, languageCode: $languageCode)';
}


}

/// @nodoc
abstract mixin class _$SettingModelCopyWith<$Res> implements $SettingModelCopyWith<$Res> {
  factory _$SettingModelCopyWith(_SettingModel value, $Res Function(_SettingModel) _then) = __$SettingModelCopyWithImpl;
@override @useResult
$Res call({
 ThemeModeType themeMode, String languageCode
});




}
/// @nodoc
class __$SettingModelCopyWithImpl<$Res>
    implements _$SettingModelCopyWith<$Res> {
  __$SettingModelCopyWithImpl(this._self, this._then);

  final _SettingModel _self;
  final $Res Function(_SettingModel) _then;

/// Create a copy of SettingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeMode = null,Object? languageCode = null,}) {
  return _then(_SettingModel(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeModeType,languageCode: null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
