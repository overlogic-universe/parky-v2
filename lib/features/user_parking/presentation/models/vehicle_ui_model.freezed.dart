// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VehicleUiModel {

 String get id; String get plate; String get userId;
/// Create a copy of VehicleUiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleUiModelCopyWith<VehicleUiModel> get copyWith => _$VehicleUiModelCopyWithImpl<VehicleUiModel>(this as VehicleUiModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleUiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.plate, plate) || other.plate == plate)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,id,plate,userId);

@override
String toString() {
  return 'VehicleUiModel(id: $id, plate: $plate, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $VehicleUiModelCopyWith<$Res>  {
  factory $VehicleUiModelCopyWith(VehicleUiModel value, $Res Function(VehicleUiModel) _then) = _$VehicleUiModelCopyWithImpl;
@useResult
$Res call({
 String id, String plate, String userId
});




}
/// @nodoc
class _$VehicleUiModelCopyWithImpl<$Res>
    implements $VehicleUiModelCopyWith<$Res> {
  _$VehicleUiModelCopyWithImpl(this._self, this._then);

  final VehicleUiModel _self;
  final $Res Function(VehicleUiModel) _then;

/// Create a copy of VehicleUiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? plate = null,Object? userId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,plate: null == plate ? _self.plate : plate // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _VehicleUiModel implements VehicleUiModel {
  const _VehicleUiModel({required this.id, required this.plate, required this.userId});
  

@override final  String id;
@override final  String plate;
@override final  String userId;

/// Create a copy of VehicleUiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleUiModelCopyWith<_VehicleUiModel> get copyWith => __$VehicleUiModelCopyWithImpl<_VehicleUiModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleUiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.plate, plate) || other.plate == plate)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,id,plate,userId);

@override
String toString() {
  return 'VehicleUiModel(id: $id, plate: $plate, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$VehicleUiModelCopyWith<$Res> implements $VehicleUiModelCopyWith<$Res> {
  factory _$VehicleUiModelCopyWith(_VehicleUiModel value, $Res Function(_VehicleUiModel) _then) = __$VehicleUiModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String plate, String userId
});




}
/// @nodoc
class __$VehicleUiModelCopyWithImpl<$Res>
    implements _$VehicleUiModelCopyWith<$Res> {
  __$VehicleUiModelCopyWithImpl(this._self, this._then);

  final _VehicleUiModel _self;
  final $Res Function(_VehicleUiModel) _then;

/// Create a copy of VehicleUiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? plate = null,Object? userId = null,}) {
  return _then(_VehicleUiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,plate: null == plate ? _self.plate : plate // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
