// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parking_lot_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ParkingLotState {

 Map<WeekDay, List<ParkingLotScheduleEntity>> get parkingLotScheduleMap;
/// Create a copy of ParkingLotState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParkingLotStateCopyWith<ParkingLotState> get copyWith => _$ParkingLotStateCopyWithImpl<ParkingLotState>(this as ParkingLotState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParkingLotState&&const DeepCollectionEquality().equals(other.parkingLotScheduleMap, parkingLotScheduleMap));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(parkingLotScheduleMap));

@override
String toString() {
  return 'ParkingLotState(parkingLotScheduleMap: $parkingLotScheduleMap)';
}


}

/// @nodoc
abstract mixin class $ParkingLotStateCopyWith<$Res>  {
  factory $ParkingLotStateCopyWith(ParkingLotState value, $Res Function(ParkingLotState) _then) = _$ParkingLotStateCopyWithImpl;
@useResult
$Res call({
 Map<WeekDay, List<ParkingLotScheduleEntity>> parkingLotScheduleMap
});




}
/// @nodoc
class _$ParkingLotStateCopyWithImpl<$Res>
    implements $ParkingLotStateCopyWith<$Res> {
  _$ParkingLotStateCopyWithImpl(this._self, this._then);

  final ParkingLotState _self;
  final $Res Function(ParkingLotState) _then;

/// Create a copy of ParkingLotState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? parkingLotScheduleMap = null,}) {
  return _then(_self.copyWith(
parkingLotScheduleMap: null == parkingLotScheduleMap ? _self.parkingLotScheduleMap : parkingLotScheduleMap // ignore: cast_nullable_to_non_nullable
as Map<WeekDay, List<ParkingLotScheduleEntity>>,
  ));
}

}


/// @nodoc


class _ParkingLotState implements ParkingLotState {
  const _ParkingLotState({required final  Map<WeekDay, List<ParkingLotScheduleEntity>> parkingLotScheduleMap}): _parkingLotScheduleMap = parkingLotScheduleMap;
  

 final  Map<WeekDay, List<ParkingLotScheduleEntity>> _parkingLotScheduleMap;
@override Map<WeekDay, List<ParkingLotScheduleEntity>> get parkingLotScheduleMap {
  if (_parkingLotScheduleMap is EqualUnmodifiableMapView) return _parkingLotScheduleMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_parkingLotScheduleMap);
}


/// Create a copy of ParkingLotState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParkingLotStateCopyWith<_ParkingLotState> get copyWith => __$ParkingLotStateCopyWithImpl<_ParkingLotState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParkingLotState&&const DeepCollectionEquality().equals(other._parkingLotScheduleMap, _parkingLotScheduleMap));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_parkingLotScheduleMap));

@override
String toString() {
  return 'ParkingLotState(parkingLotScheduleMap: $parkingLotScheduleMap)';
}


}

/// @nodoc
abstract mixin class _$ParkingLotStateCopyWith<$Res> implements $ParkingLotStateCopyWith<$Res> {
  factory _$ParkingLotStateCopyWith(_ParkingLotState value, $Res Function(_ParkingLotState) _then) = __$ParkingLotStateCopyWithImpl;
@override @useResult
$Res call({
 Map<WeekDay, List<ParkingLotScheduleEntity>> parkingLotScheduleMap
});




}
/// @nodoc
class __$ParkingLotStateCopyWithImpl<$Res>
    implements _$ParkingLotStateCopyWith<$Res> {
  __$ParkingLotStateCopyWithImpl(this._self, this._then);

  final _ParkingLotState _self;
  final $Res Function(_ParkingLotState) _then;

/// Create a copy of ParkingLotState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? parkingLotScheduleMap = null,}) {
  return _then(_ParkingLotState(
parkingLotScheduleMap: null == parkingLotScheduleMap ? _self._parkingLotScheduleMap : parkingLotScheduleMap // ignore: cast_nullable_to_non_nullable
as Map<WeekDay, List<ParkingLotScheduleEntity>>,
  ));
}


}

// dart format on
