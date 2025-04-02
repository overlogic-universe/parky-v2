// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingState {

 ThemeModeType get themeModeType; String get localeId;
/// Create a copy of SettingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingStateCopyWith<SettingState> get copyWith => _$SettingStateCopyWithImpl<SettingState>(this as SettingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingState&&(identical(other.themeModeType, themeModeType) || other.themeModeType == themeModeType)&&(identical(other.localeId, localeId) || other.localeId == localeId));
}


@override
int get hashCode => Object.hash(runtimeType,themeModeType,localeId);

@override
String toString() {
  return 'SettingState(themeModeType: $themeModeType, localeId: $localeId)';
}


}

/// @nodoc
abstract mixin class $SettingStateCopyWith<$Res>  {
  factory $SettingStateCopyWith(SettingState value, $Res Function(SettingState) _then) = _$SettingStateCopyWithImpl;
@useResult
$Res call({
 ThemeModeType themeModeType, String localeId
});




}
/// @nodoc
class _$SettingStateCopyWithImpl<$Res>
    implements $SettingStateCopyWith<$Res> {
  _$SettingStateCopyWithImpl(this._self, this._then);

  final SettingState _self;
  final $Res Function(SettingState) _then;

/// Create a copy of SettingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? themeModeType = null,Object? localeId = null,}) {
  return _then(_self.copyWith(
themeModeType: null == themeModeType ? _self.themeModeType : themeModeType // ignore: cast_nullable_to_non_nullable
as ThemeModeType,localeId: null == localeId ? _self.localeId : localeId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _SettingState implements SettingState {
  const _SettingState({this.themeModeType = ThemeModeType.main, this.localeId = LocaleIdConstant.ID});
  

@override@JsonKey() final  ThemeModeType themeModeType;
@override@JsonKey() final  String localeId;

/// Create a copy of SettingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingStateCopyWith<_SettingState> get copyWith => __$SettingStateCopyWithImpl<_SettingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingState&&(identical(other.themeModeType, themeModeType) || other.themeModeType == themeModeType)&&(identical(other.localeId, localeId) || other.localeId == localeId));
}


@override
int get hashCode => Object.hash(runtimeType,themeModeType,localeId);

@override
String toString() {
  return 'SettingState(themeModeType: $themeModeType, localeId: $localeId)';
}


}

/// @nodoc
abstract mixin class _$SettingStateCopyWith<$Res> implements $SettingStateCopyWith<$Res> {
  factory _$SettingStateCopyWith(_SettingState value, $Res Function(_SettingState) _then) = __$SettingStateCopyWithImpl;
@override @useResult
$Res call({
 ThemeModeType themeModeType, String localeId
});




}
/// @nodoc
class __$SettingStateCopyWithImpl<$Res>
    implements _$SettingStateCopyWith<$Res> {
  __$SettingStateCopyWithImpl(this._self, this._then);

  final _SettingState _self;
  final $Res Function(_SettingState) _then;

/// Create a copy of SettingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeModeType = null,Object? localeId = null,}) {
  return _then(_SettingState(
themeModeType: null == themeModeType ? _self.themeModeType : themeModeType // ignore: cast_nullable_to_non_nullable
as ThemeModeType,localeId: null == localeId ? _self.localeId : localeId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
