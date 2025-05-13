// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tab_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TabModel {

 String get icon;
/// Create a copy of TabModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TabModelCopyWith<TabModel> get copyWith => _$TabModelCopyWithImpl<TabModel>(this as TabModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TabModel&&(identical(other.icon, icon) || other.icon == icon));
}


@override
int get hashCode => Object.hash(runtimeType,icon);

@override
String toString() {
  return 'TabModel(icon: $icon)';
}


}

/// @nodoc
abstract mixin class $TabModelCopyWith<$Res>  {
  factory $TabModelCopyWith(TabModel value, $Res Function(TabModel) _then) = _$TabModelCopyWithImpl;
@useResult
$Res call({
 String icon
});




}
/// @nodoc
class _$TabModelCopyWithImpl<$Res>
    implements $TabModelCopyWith<$Res> {
  _$TabModelCopyWithImpl(this._self, this._then);

  final TabModel _self;
  final $Res Function(TabModel) _then;

/// Create a copy of TabModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? icon = null,}) {
  return _then(_self.copyWith(
icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _TabModel implements TabModel {
  const _TabModel({required this.icon});
  

@override final  String icon;

/// Create a copy of TabModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TabModelCopyWith<_TabModel> get copyWith => __$TabModelCopyWithImpl<_TabModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TabModel&&(identical(other.icon, icon) || other.icon == icon));
}


@override
int get hashCode => Object.hash(runtimeType,icon);

@override
String toString() {
  return 'TabModel(icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$TabModelCopyWith<$Res> implements $TabModelCopyWith<$Res> {
  factory _$TabModelCopyWith(_TabModel value, $Res Function(_TabModel) _then) = __$TabModelCopyWithImpl;
@override @useResult
$Res call({
 String icon
});




}
/// @nodoc
class __$TabModelCopyWithImpl<$Res>
    implements _$TabModelCopyWith<$Res> {
  __$TabModelCopyWithImpl(this._self, this._then);

  final _TabModel _self;
  final $Res Function(_TabModel) _then;

/// Create a copy of TabModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? icon = null,}) {
  return _then(_TabModel(
icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
