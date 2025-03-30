// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingItemModel {

 String get name; Widget get suffixWidget;
/// Create a copy of SettingItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingItemModelCopyWith<SettingItemModel> get copyWith => _$SettingItemModelCopyWithImpl<SettingItemModel>(this as SettingItemModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingItemModel&&(identical(other.name, name) || other.name == name)&&(identical(other.suffixWidget, suffixWidget) || other.suffixWidget == suffixWidget));
}


@override
int get hashCode => Object.hash(runtimeType,name,suffixWidget);

@override
String toString() {
  return 'SettingItemModel(name: $name, suffixWidget: $suffixWidget)';
}


}

/// @nodoc
abstract mixin class $SettingItemModelCopyWith<$Res>  {
  factory $SettingItemModelCopyWith(SettingItemModel value, $Res Function(SettingItemModel) _then) = _$SettingItemModelCopyWithImpl;
@useResult
$Res call({
 String name, Widget suffixWidget
});




}
/// @nodoc
class _$SettingItemModelCopyWithImpl<$Res>
    implements $SettingItemModelCopyWith<$Res> {
  _$SettingItemModelCopyWithImpl(this._self, this._then);

  final SettingItemModel _self;
  final $Res Function(SettingItemModel) _then;

/// Create a copy of SettingItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? suffixWidget = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,suffixWidget: null == suffixWidget ? _self.suffixWidget : suffixWidget // ignore: cast_nullable_to_non_nullable
as Widget,
  ));
}

}


/// @nodoc


class _SettingItemModel implements SettingItemModel {
  const _SettingItemModel({required this.name, required this.suffixWidget});
  

@override final  String name;
@override final  Widget suffixWidget;

/// Create a copy of SettingItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingItemModelCopyWith<_SettingItemModel> get copyWith => __$SettingItemModelCopyWithImpl<_SettingItemModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingItemModel&&(identical(other.name, name) || other.name == name)&&(identical(other.suffixWidget, suffixWidget) || other.suffixWidget == suffixWidget));
}


@override
int get hashCode => Object.hash(runtimeType,name,suffixWidget);

@override
String toString() {
  return 'SettingItemModel(name: $name, suffixWidget: $suffixWidget)';
}


}

/// @nodoc
abstract mixin class _$SettingItemModelCopyWith<$Res> implements $SettingItemModelCopyWith<$Res> {
  factory _$SettingItemModelCopyWith(_SettingItemModel value, $Res Function(_SettingItemModel) _then) = __$SettingItemModelCopyWithImpl;
@override @useResult
$Res call({
 String name, Widget suffixWidget
});




}
/// @nodoc
class __$SettingItemModelCopyWithImpl<$Res>
    implements _$SettingItemModelCopyWith<$Res> {
  __$SettingItemModelCopyWithImpl(this._self, this._then);

  final _SettingItemModel _self;
  final $Res Function(_SettingItemModel) _then;

/// Create a copy of SettingItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? suffixWidget = null,}) {
  return _then(_SettingItemModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,suffixWidget: null == suffixWidget ? _self.suffixWidget : suffixWidget // ignore: cast_nullable_to_non_nullable
as Widget,
  ));
}


}

// dart format on
