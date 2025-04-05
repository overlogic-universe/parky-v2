// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'park_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ParkUiModel {

 String get id; ParkStatus get status; String get lastActivityTime; String get lastActivityDay; String get userId;
/// Create a copy of ParkUiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParkUiModelCopyWith<ParkUiModel> get copyWith => _$ParkUiModelCopyWithImpl<ParkUiModel>(this as ParkUiModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParkUiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.lastActivityTime, lastActivityTime) || other.lastActivityTime == lastActivityTime)&&(identical(other.lastActivityDay, lastActivityDay) || other.lastActivityDay == lastActivityDay)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,id,status,lastActivityTime,lastActivityDay,userId);

@override
String toString() {
  return 'ParkUiModel(id: $id, status: $status, lastActivityTime: $lastActivityTime, lastActivityDay: $lastActivityDay, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $ParkUiModelCopyWith<$Res>  {
  factory $ParkUiModelCopyWith(ParkUiModel value, $Res Function(ParkUiModel) _then) = _$ParkUiModelCopyWithImpl;
@useResult
$Res call({
 String id, ParkStatus status, String lastActivityTime, String lastActivityDay, String userId
});




}
/// @nodoc
class _$ParkUiModelCopyWithImpl<$Res>
    implements $ParkUiModelCopyWith<$Res> {
  _$ParkUiModelCopyWithImpl(this._self, this._then);

  final ParkUiModel _self;
  final $Res Function(ParkUiModel) _then;

/// Create a copy of ParkUiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? lastActivityTime = null,Object? lastActivityDay = null,Object? userId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ParkStatus,lastActivityTime: null == lastActivityTime ? _self.lastActivityTime : lastActivityTime // ignore: cast_nullable_to_non_nullable
as String,lastActivityDay: null == lastActivityDay ? _self.lastActivityDay : lastActivityDay // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _ParkUiModel implements ParkUiModel {
  const _ParkUiModel({required this.id, required this.status, required this.lastActivityTime, required this.lastActivityDay, required this.userId});
  

@override final  String id;
@override final  ParkStatus status;
@override final  String lastActivityTime;
@override final  String lastActivityDay;
@override final  String userId;

/// Create a copy of ParkUiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParkUiModelCopyWith<_ParkUiModel> get copyWith => __$ParkUiModelCopyWithImpl<_ParkUiModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParkUiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.lastActivityTime, lastActivityTime) || other.lastActivityTime == lastActivityTime)&&(identical(other.lastActivityDay, lastActivityDay) || other.lastActivityDay == lastActivityDay)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,id,status,lastActivityTime,lastActivityDay,userId);

@override
String toString() {
  return 'ParkUiModel(id: $id, status: $status, lastActivityTime: $lastActivityTime, lastActivityDay: $lastActivityDay, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$ParkUiModelCopyWith<$Res> implements $ParkUiModelCopyWith<$Res> {
  factory _$ParkUiModelCopyWith(_ParkUiModel value, $Res Function(_ParkUiModel) _then) = __$ParkUiModelCopyWithImpl;
@override @useResult
$Res call({
 String id, ParkStatus status, String lastActivityTime, String lastActivityDay, String userId
});




}
/// @nodoc
class __$ParkUiModelCopyWithImpl<$Res>
    implements _$ParkUiModelCopyWith<$Res> {
  __$ParkUiModelCopyWithImpl(this._self, this._then);

  final _ParkUiModel _self;
  final $Res Function(_ParkUiModel) _then;

/// Create a copy of ParkUiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? lastActivityTime = null,Object? lastActivityDay = null,Object? userId = null,}) {
  return _then(_ParkUiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ParkStatus,lastActivityTime: null == lastActivityTime ? _self.lastActivityTime : lastActivityTime // ignore: cast_nullable_to_non_nullable
as String,lastActivityDay: null == lastActivityDay ? _self.lastActivityDay : lastActivityDay // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
