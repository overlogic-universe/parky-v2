// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingEntity {

 ThemeModeType get themeMode; String get languageCode;
/// Create a copy of SettingEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingEntityCopyWith<SettingEntity> get copyWith => _$SettingEntityCopyWithImpl<SettingEntity>(this as SettingEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingEntity&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode));
}


@override
int get hashCode => Object.hash(runtimeType,themeMode,languageCode);

@override
String toString() {
  return 'SettingEntity(themeMode: $themeMode, languageCode: $languageCode)';
}


}

/// @nodoc
abstract mixin class $SettingEntityCopyWith<$Res>  {
  factory $SettingEntityCopyWith(SettingEntity value, $Res Function(SettingEntity) _then) = _$SettingEntityCopyWithImpl;
@useResult
$Res call({
 ThemeModeType themeMode, String languageCode
});




}
/// @nodoc
class _$SettingEntityCopyWithImpl<$Res>
    implements $SettingEntityCopyWith<$Res> {
  _$SettingEntityCopyWithImpl(this._self, this._then);

  final SettingEntity _self;
  final $Res Function(SettingEntity) _then;

/// Create a copy of SettingEntity
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


class _Setting implements SettingEntity {
  const _Setting({required this.themeMode, required this.languageCode});
  

@override final  ThemeModeType themeMode;
@override final  String languageCode;

/// Create a copy of SettingEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingCopyWith<_Setting> get copyWith => __$SettingCopyWithImpl<_Setting>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Setting&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode));
}


@override
int get hashCode => Object.hash(runtimeType,themeMode,languageCode);

@override
String toString() {
  return 'SettingEntity(themeMode: $themeMode, languageCode: $languageCode)';
}


}

/// @nodoc
abstract mixin class _$SettingCopyWith<$Res> implements $SettingEntityCopyWith<$Res> {
  factory _$SettingCopyWith(_Setting value, $Res Function(_Setting) _then) = __$SettingCopyWithImpl;
@override @useResult
$Res call({
 ThemeModeType themeMode, String languageCode
});




}
/// @nodoc
class __$SettingCopyWithImpl<$Res>
    implements _$SettingCopyWith<$Res> {
  __$SettingCopyWithImpl(this._self, this._then);

  final _Setting _self;
  final $Res Function(_Setting) _then;

/// Create a copy of SettingEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeMode = null,Object? languageCode = null,}) {
  return _then(_Setting(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeModeType,languageCode: null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
