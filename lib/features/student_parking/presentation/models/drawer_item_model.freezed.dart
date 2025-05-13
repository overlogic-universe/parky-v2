// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drawer_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DrawerItemModel {

 String get name; String get icon; bool get isLogout;
/// Create a copy of DrawerItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DrawerItemModelCopyWith<DrawerItemModel> get copyWith => _$DrawerItemModelCopyWithImpl<DrawerItemModel>(this as DrawerItemModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DrawerItemModel&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.isLogout, isLogout) || other.isLogout == isLogout));
}


@override
int get hashCode => Object.hash(runtimeType,name,icon,isLogout);

@override
String toString() {
  return 'DrawerItemModel(name: $name, icon: $icon, isLogout: $isLogout)';
}


}

/// @nodoc
abstract mixin class $DrawerItemModelCopyWith<$Res>  {
  factory $DrawerItemModelCopyWith(DrawerItemModel value, $Res Function(DrawerItemModel) _then) = _$DrawerItemModelCopyWithImpl;
@useResult
$Res call({
 String name, String icon, bool isLogout
});




}
/// @nodoc
class _$DrawerItemModelCopyWithImpl<$Res>
    implements $DrawerItemModelCopyWith<$Res> {
  _$DrawerItemModelCopyWithImpl(this._self, this._then);

  final DrawerItemModel _self;
  final $Res Function(DrawerItemModel) _then;

/// Create a copy of DrawerItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? icon = null,Object? isLogout = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,isLogout: null == isLogout ? _self.isLogout : isLogout // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _DrawerItemModel implements DrawerItemModel {
  const _DrawerItemModel({required this.name, required this.icon, this.isLogout = false});
  

@override final  String name;
@override final  String icon;
@override@JsonKey() final  bool isLogout;

/// Create a copy of DrawerItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DrawerItemModelCopyWith<_DrawerItemModel> get copyWith => __$DrawerItemModelCopyWithImpl<_DrawerItemModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DrawerItemModel&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.isLogout, isLogout) || other.isLogout == isLogout));
}


@override
int get hashCode => Object.hash(runtimeType,name,icon,isLogout);

@override
String toString() {
  return 'DrawerItemModel(name: $name, icon: $icon, isLogout: $isLogout)';
}


}

/// @nodoc
abstract mixin class _$DrawerItemModelCopyWith<$Res> implements $DrawerItemModelCopyWith<$Res> {
  factory _$DrawerItemModelCopyWith(_DrawerItemModel value, $Res Function(_DrawerItemModel) _then) = __$DrawerItemModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String icon, bool isLogout
});




}
/// @nodoc
class __$DrawerItemModelCopyWithImpl<$Res>
    implements _$DrawerItemModelCopyWith<$Res> {
  __$DrawerItemModelCopyWithImpl(this._self, this._then);

  final _DrawerItemModel _self;
  final $Res Function(_DrawerItemModel) _then;

/// Create a copy of DrawerItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? icon = null,Object? isLogout = null,}) {
  return _then(_DrawerItemModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,isLogout: null == isLogout ? _self.isLogout : isLogout // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
