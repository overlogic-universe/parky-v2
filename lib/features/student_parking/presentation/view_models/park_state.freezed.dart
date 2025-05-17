// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'park_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ParkState {

 ParkingHistoryUiModel? get currentParkingHistory; ParkingLotEntity? get currentParkingLot;
/// Create a copy of ParkState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParkStateCopyWith<ParkState> get copyWith => _$ParkStateCopyWithImpl<ParkState>(this as ParkState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParkState&&(identical(other.currentParkingHistory, currentParkingHistory) || other.currentParkingHistory == currentParkingHistory)&&(identical(other.currentParkingLot, currentParkingLot) || other.currentParkingLot == currentParkingLot));
}


@override
int get hashCode => Object.hash(runtimeType,currentParkingHistory,currentParkingLot);

@override
String toString() {
  return 'ParkState(currentParkingHistory: $currentParkingHistory, currentParkingLot: $currentParkingLot)';
}


}

/// @nodoc
abstract mixin class $ParkStateCopyWith<$Res>  {
  factory $ParkStateCopyWith(ParkState value, $Res Function(ParkState) _then) = _$ParkStateCopyWithImpl;
@useResult
$Res call({
 ParkingHistoryUiModel? currentParkingHistory, ParkingLotEntity? currentParkingLot
});


$ParkingHistoryUiModelCopyWith<$Res>? get currentParkingHistory;

}
/// @nodoc
class _$ParkStateCopyWithImpl<$Res>
    implements $ParkStateCopyWith<$Res> {
  _$ParkStateCopyWithImpl(this._self, this._then);

  final ParkState _self;
  final $Res Function(ParkState) _then;

/// Create a copy of ParkState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentParkingHistory = freezed,Object? currentParkingLot = freezed,}) {
  return _then(_self.copyWith(
currentParkingHistory: freezed == currentParkingHistory ? _self.currentParkingHistory : currentParkingHistory // ignore: cast_nullable_to_non_nullable
as ParkingHistoryUiModel?,currentParkingLot: freezed == currentParkingLot ? _self.currentParkingLot : currentParkingLot // ignore: cast_nullable_to_non_nullable
as ParkingLotEntity?,
  ));
}
/// Create a copy of ParkState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParkingHistoryUiModelCopyWith<$Res>? get currentParkingHistory {
    if (_self.currentParkingHistory == null) {
    return null;
  }

  return $ParkingHistoryUiModelCopyWith<$Res>(_self.currentParkingHistory!, (value) {
    return _then(_self.copyWith(currentParkingHistory: value));
  });
}
}


/// @nodoc


class _ParkState implements ParkState {
  const _ParkState({this.currentParkingHistory = null, this.currentParkingLot = null});
  

@override@JsonKey() final  ParkingHistoryUiModel? currentParkingHistory;
@override@JsonKey() final  ParkingLotEntity? currentParkingLot;

/// Create a copy of ParkState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParkStateCopyWith<_ParkState> get copyWith => __$ParkStateCopyWithImpl<_ParkState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParkState&&(identical(other.currentParkingHistory, currentParkingHistory) || other.currentParkingHistory == currentParkingHistory)&&(identical(other.currentParkingLot, currentParkingLot) || other.currentParkingLot == currentParkingLot));
}


@override
int get hashCode => Object.hash(runtimeType,currentParkingHistory,currentParkingLot);

@override
String toString() {
  return 'ParkState(currentParkingHistory: $currentParkingHistory, currentParkingLot: $currentParkingLot)';
}


}

/// @nodoc
abstract mixin class _$ParkStateCopyWith<$Res> implements $ParkStateCopyWith<$Res> {
  factory _$ParkStateCopyWith(_ParkState value, $Res Function(_ParkState) _then) = __$ParkStateCopyWithImpl;
@override @useResult
$Res call({
 ParkingHistoryUiModel? currentParkingHistory, ParkingLotEntity? currentParkingLot
});


@override $ParkingHistoryUiModelCopyWith<$Res>? get currentParkingHistory;

}
/// @nodoc
class __$ParkStateCopyWithImpl<$Res>
    implements _$ParkStateCopyWith<$Res> {
  __$ParkStateCopyWithImpl(this._self, this._then);

  final _ParkState _self;
  final $Res Function(_ParkState) _then;

/// Create a copy of ParkState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentParkingHistory = freezed,Object? currentParkingLot = freezed,}) {
  return _then(_ParkState(
currentParkingHistory: freezed == currentParkingHistory ? _self.currentParkingHistory : currentParkingHistory // ignore: cast_nullable_to_non_nullable
as ParkingHistoryUiModel?,currentParkingLot: freezed == currentParkingLot ? _self.currentParkingLot : currentParkingLot // ignore: cast_nullable_to_non_nullable
as ParkingLotEntity?,
  ));
}

/// Create a copy of ParkState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParkingHistoryUiModelCopyWith<$Res>? get currentParkingHistory {
    if (_self.currentParkingHistory == null) {
    return null;
  }

  return $ParkingHistoryUiModelCopyWith<$Res>(_self.currentParkingHistory!, (value) {
    return _then(_self.copyWith(currentParkingHistory: value));
  });
}
}

// dart format on
