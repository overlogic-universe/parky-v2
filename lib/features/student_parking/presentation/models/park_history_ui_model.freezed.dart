// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'park_history_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ParkingHistoryUiModel {

 String get id; ParkStatus? get status; String? get lastActivityTime; String? get lastActivityDay; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of ParkingHistoryUiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParkingHistoryUiModelCopyWith<ParkingHistoryUiModel> get copyWith => _$ParkingHistoryUiModelCopyWithImpl<ParkingHistoryUiModel>(this as ParkingHistoryUiModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParkingHistoryUiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.lastActivityTime, lastActivityTime) || other.lastActivityTime == lastActivityTime)&&(identical(other.lastActivityDay, lastActivityDay) || other.lastActivityDay == lastActivityDay)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,status,lastActivityTime,lastActivityDay,createdAt,updatedAt);

@override
String toString() {
  return 'ParkingHistoryUiModel(id: $id, status: $status, lastActivityTime: $lastActivityTime, lastActivityDay: $lastActivityDay, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ParkingHistoryUiModelCopyWith<$Res>  {
  factory $ParkingHistoryUiModelCopyWith(ParkingHistoryUiModel value, $Res Function(ParkingHistoryUiModel) _then) = _$ParkingHistoryUiModelCopyWithImpl;
@useResult
$Res call({
 String id, ParkStatus? status, String? lastActivityTime, String? lastActivityDay, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$ParkingHistoryUiModelCopyWithImpl<$Res>
    implements $ParkingHistoryUiModelCopyWith<$Res> {
  _$ParkingHistoryUiModelCopyWithImpl(this._self, this._then);

  final ParkingHistoryUiModel _self;
  final $Res Function(ParkingHistoryUiModel) _then;

/// Create a copy of ParkingHistoryUiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = freezed,Object? lastActivityTime = freezed,Object? lastActivityDay = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ParkStatus?,lastActivityTime: freezed == lastActivityTime ? _self.lastActivityTime : lastActivityTime // ignore: cast_nullable_to_non_nullable
as String?,lastActivityDay: freezed == lastActivityDay ? _self.lastActivityDay : lastActivityDay // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc


class _ParkingHistoryUiModel implements ParkingHistoryUiModel {
  const _ParkingHistoryUiModel({required this.id, required this.status, required this.lastActivityTime, required this.lastActivityDay, required this.createdAt, required this.updatedAt});
  

@override final  String id;
@override final  ParkStatus? status;
@override final  String? lastActivityTime;
@override final  String? lastActivityDay;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of ParkingHistoryUiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParkingHistoryUiModelCopyWith<_ParkingHistoryUiModel> get copyWith => __$ParkingHistoryUiModelCopyWithImpl<_ParkingHistoryUiModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParkingHistoryUiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.lastActivityTime, lastActivityTime) || other.lastActivityTime == lastActivityTime)&&(identical(other.lastActivityDay, lastActivityDay) || other.lastActivityDay == lastActivityDay)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,status,lastActivityTime,lastActivityDay,createdAt,updatedAt);

@override
String toString() {
  return 'ParkingHistoryUiModel(id: $id, status: $status, lastActivityTime: $lastActivityTime, lastActivityDay: $lastActivityDay, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ParkingHistoryUiModelCopyWith<$Res> implements $ParkingHistoryUiModelCopyWith<$Res> {
  factory _$ParkingHistoryUiModelCopyWith(_ParkingHistoryUiModel value, $Res Function(_ParkingHistoryUiModel) _then) = __$ParkingHistoryUiModelCopyWithImpl;
@override @useResult
$Res call({
 String id, ParkStatus? status, String? lastActivityTime, String? lastActivityDay, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$ParkingHistoryUiModelCopyWithImpl<$Res>
    implements _$ParkingHistoryUiModelCopyWith<$Res> {
  __$ParkingHistoryUiModelCopyWithImpl(this._self, this._then);

  final _ParkingHistoryUiModel _self;
  final $Res Function(_ParkingHistoryUiModel) _then;

/// Create a copy of ParkingHistoryUiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = freezed,Object? lastActivityTime = freezed,Object? lastActivityDay = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ParkingHistoryUiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ParkStatus?,lastActivityTime: freezed == lastActivityTime ? _self.lastActivityTime : lastActivityTime // ignore: cast_nullable_to_non_nullable
as String?,lastActivityDay: freezed == lastActivityDay ? _self.lastActivityDay : lastActivityDay // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
