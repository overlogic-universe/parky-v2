// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VehicleState {

 VehicleEntity? get vehicle;
/// Create a copy of VehicleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleStateCopyWith<VehicleState> get copyWith => _$VehicleStateCopyWithImpl<VehicleState>(this as VehicleState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleState&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle));
}


@override
int get hashCode => Object.hash(runtimeType,vehicle);

@override
String toString() {
  return 'VehicleState(vehicle: $vehicle)';
}


}

/// @nodoc
abstract mixin class $VehicleStateCopyWith<$Res>  {
  factory $VehicleStateCopyWith(VehicleState value, $Res Function(VehicleState) _then) = _$VehicleStateCopyWithImpl;
@useResult
$Res call({
 VehicleEntity? vehicle
});




}
/// @nodoc
class _$VehicleStateCopyWithImpl<$Res>
    implements $VehicleStateCopyWith<$Res> {
  _$VehicleStateCopyWithImpl(this._self, this._then);

  final VehicleState _self;
  final $Res Function(VehicleState) _then;

/// Create a copy of VehicleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vehicle = freezed,}) {
  return _then(_self.copyWith(
vehicle: freezed == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as VehicleEntity?,
  ));
}

}


/// @nodoc


class _VehicleState implements VehicleState {
  const _VehicleState({this.vehicle = null});
  

@override@JsonKey() final  VehicleEntity? vehicle;

/// Create a copy of VehicleState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleStateCopyWith<_VehicleState> get copyWith => __$VehicleStateCopyWithImpl<_VehicleState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleState&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle));
}


@override
int get hashCode => Object.hash(runtimeType,vehicle);

@override
String toString() {
  return 'VehicleState(vehicle: $vehicle)';
}


}

/// @nodoc
abstract mixin class _$VehicleStateCopyWith<$Res> implements $VehicleStateCopyWith<$Res> {
  factory _$VehicleStateCopyWith(_VehicleState value, $Res Function(_VehicleState) _then) = __$VehicleStateCopyWithImpl;
@override @useResult
$Res call({
 VehicleEntity? vehicle
});




}
/// @nodoc
class __$VehicleStateCopyWithImpl<$Res>
    implements _$VehicleStateCopyWith<$Res> {
  __$VehicleStateCopyWithImpl(this._self, this._then);

  final _VehicleState _self;
  final $Res Function(_VehicleState) _then;

/// Create a copy of VehicleState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vehicle = freezed,}) {
  return _then(_VehicleState(
vehicle: freezed == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as VehicleEntity?,
  ));
}


}

// dart format on
