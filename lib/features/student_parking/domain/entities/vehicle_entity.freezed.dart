// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VehicleEntity {

 String get id; String get plate; String get studentId;
/// Create a copy of VehicleEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleEntityCopyWith<VehicleEntity> get copyWith => _$VehicleEntityCopyWithImpl<VehicleEntity>(this as VehicleEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.plate, plate) || other.plate == plate)&&(identical(other.studentId, studentId) || other.studentId == studentId));
}


@override
int get hashCode => Object.hash(runtimeType,id,plate,studentId);

@override
String toString() {
  return 'VehicleEntity(id: $id, plate: $plate, studentId: $studentId)';
}


}

/// @nodoc
abstract mixin class $VehicleEntityCopyWith<$Res>  {
  factory $VehicleEntityCopyWith(VehicleEntity value, $Res Function(VehicleEntity) _then) = _$VehicleEntityCopyWithImpl;
@useResult
$Res call({
 String id, String plate, String studentId
});




}
/// @nodoc
class _$VehicleEntityCopyWithImpl<$Res>
    implements $VehicleEntityCopyWith<$Res> {
  _$VehicleEntityCopyWithImpl(this._self, this._then);

  final VehicleEntity _self;
  final $Res Function(VehicleEntity) _then;

/// Create a copy of VehicleEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? plate = null,Object? studentId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,plate: null == plate ? _self.plate : plate // ignore: cast_nullable_to_non_nullable
as String,studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _VehicleEntity implements VehicleEntity {
  const _VehicleEntity({required this.id, required this.plate, required this.studentId});
  

@override final  String id;
@override final  String plate;
@override final  String studentId;

/// Create a copy of VehicleEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleEntityCopyWith<_VehicleEntity> get copyWith => __$VehicleEntityCopyWithImpl<_VehicleEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.plate, plate) || other.plate == plate)&&(identical(other.studentId, studentId) || other.studentId == studentId));
}


@override
int get hashCode => Object.hash(runtimeType,id,plate,studentId);

@override
String toString() {
  return 'VehicleEntity(id: $id, plate: $plate, studentId: $studentId)';
}


}

/// @nodoc
abstract mixin class _$VehicleEntityCopyWith<$Res> implements $VehicleEntityCopyWith<$Res> {
  factory _$VehicleEntityCopyWith(_VehicleEntity value, $Res Function(_VehicleEntity) _then) = __$VehicleEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String plate, String studentId
});




}
/// @nodoc
class __$VehicleEntityCopyWithImpl<$Res>
    implements _$VehicleEntityCopyWith<$Res> {
  __$VehicleEntityCopyWithImpl(this._self, this._then);

  final _VehicleEntity _self;
  final $Res Function(_VehicleEntity) _then;

/// Create a copy of VehicleEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? plate = null,Object? studentId = null,}) {
  return _then(_VehicleEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,plate: null == plate ? _self.plate : plate // ignore: cast_nullable_to_non_nullable
as String,studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
