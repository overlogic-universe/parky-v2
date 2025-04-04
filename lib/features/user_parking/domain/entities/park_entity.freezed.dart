// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'park_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ParkEntity {

 String get id; ParkStatus get status; String get lastActivity; String get userId;
/// Create a copy of ParkEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParkEntityCopyWith<ParkEntity> get copyWith => _$ParkEntityCopyWithImpl<ParkEntity>(this as ParkEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParkEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.lastActivity, lastActivity) || other.lastActivity == lastActivity)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,id,status,lastActivity,userId);

@override
String toString() {
  return 'ParkEntity(id: $id, status: $status, lastActivity: $lastActivity, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $ParkEntityCopyWith<$Res>  {
  factory $ParkEntityCopyWith(ParkEntity value, $Res Function(ParkEntity) _then) = _$ParkEntityCopyWithImpl;
@useResult
$Res call({
 String id, ParkStatus status, String lastActivity, String userId
});




}
/// @nodoc
class _$ParkEntityCopyWithImpl<$Res>
    implements $ParkEntityCopyWith<$Res> {
  _$ParkEntityCopyWithImpl(this._self, this._then);

  final ParkEntity _self;
  final $Res Function(ParkEntity) _then;

/// Create a copy of ParkEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? lastActivity = null,Object? userId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ParkStatus,lastActivity: null == lastActivity ? _self.lastActivity : lastActivity // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _ParkEntity implements ParkEntity {
  const _ParkEntity({required this.id, required this.status, required this.lastActivity, required this.userId});
  

@override final  String id;
@override final  ParkStatus status;
@override final  String lastActivity;
@override final  String userId;

/// Create a copy of ParkEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParkEntityCopyWith<_ParkEntity> get copyWith => __$ParkEntityCopyWithImpl<_ParkEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParkEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.lastActivity, lastActivity) || other.lastActivity == lastActivity)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,id,status,lastActivity,userId);

@override
String toString() {
  return 'ParkEntity(id: $id, status: $status, lastActivity: $lastActivity, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$ParkEntityCopyWith<$Res> implements $ParkEntityCopyWith<$Res> {
  factory _$ParkEntityCopyWith(_ParkEntity value, $Res Function(_ParkEntity) _then) = __$ParkEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, ParkStatus status, String lastActivity, String userId
});




}
/// @nodoc
class __$ParkEntityCopyWithImpl<$Res>
    implements _$ParkEntityCopyWith<$Res> {
  __$ParkEntityCopyWithImpl(this._self, this._then);

  final _ParkEntity _self;
  final $Res Function(_ParkEntity) _then;

/// Create a copy of ParkEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? lastActivity = null,Object? userId = null,}) {
  return _then(_ParkEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ParkStatus,lastActivity: null == lastActivity ? _self.lastActivity : lastActivity // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
