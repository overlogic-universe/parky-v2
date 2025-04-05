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

 VehicleUiModel? get vehicleUiModel;
/// Create a copy of VehicleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleStateCopyWith<VehicleState> get copyWith => _$VehicleStateCopyWithImpl<VehicleState>(this as VehicleState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleState&&(identical(other.vehicleUiModel, vehicleUiModel) || other.vehicleUiModel == vehicleUiModel));
}


@override
int get hashCode => Object.hash(runtimeType,vehicleUiModel);

@override
String toString() {
  return 'VehicleState(vehicleUiModel: $vehicleUiModel)';
}


}

/// @nodoc
abstract mixin class $VehicleStateCopyWith<$Res>  {
  factory $VehicleStateCopyWith(VehicleState value, $Res Function(VehicleState) _then) = _$VehicleStateCopyWithImpl;
@useResult
$Res call({
 VehicleUiModel? vehicleUiModel
});


$VehicleUiModelCopyWith<$Res>? get vehicleUiModel;

}
/// @nodoc
class _$VehicleStateCopyWithImpl<$Res>
    implements $VehicleStateCopyWith<$Res> {
  _$VehicleStateCopyWithImpl(this._self, this._then);

  final VehicleState _self;
  final $Res Function(VehicleState) _then;

/// Create a copy of VehicleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vehicleUiModel = freezed,}) {
  return _then(_self.copyWith(
vehicleUiModel: freezed == vehicleUiModel ? _self.vehicleUiModel : vehicleUiModel // ignore: cast_nullable_to_non_nullable
as VehicleUiModel?,
  ));
}
/// Create a copy of VehicleState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleUiModelCopyWith<$Res>? get vehicleUiModel {
    if (_self.vehicleUiModel == null) {
    return null;
  }

  return $VehicleUiModelCopyWith<$Res>(_self.vehicleUiModel!, (value) {
    return _then(_self.copyWith(vehicleUiModel: value));
  });
}
}


/// @nodoc


class _VehicleState implements VehicleState {
  const _VehicleState({this.vehicleUiModel = null});
  

@override@JsonKey() final  VehicleUiModel? vehicleUiModel;

/// Create a copy of VehicleState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleStateCopyWith<_VehicleState> get copyWith => __$VehicleStateCopyWithImpl<_VehicleState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleState&&(identical(other.vehicleUiModel, vehicleUiModel) || other.vehicleUiModel == vehicleUiModel));
}


@override
int get hashCode => Object.hash(runtimeType,vehicleUiModel);

@override
String toString() {
  return 'VehicleState(vehicleUiModel: $vehicleUiModel)';
}


}

/// @nodoc
abstract mixin class _$VehicleStateCopyWith<$Res> implements $VehicleStateCopyWith<$Res> {
  factory _$VehicleStateCopyWith(_VehicleState value, $Res Function(_VehicleState) _then) = __$VehicleStateCopyWithImpl;
@override @useResult
$Res call({
 VehicleUiModel? vehicleUiModel
});


@override $VehicleUiModelCopyWith<$Res>? get vehicleUiModel;

}
/// @nodoc
class __$VehicleStateCopyWithImpl<$Res>
    implements _$VehicleStateCopyWith<$Res> {
  __$VehicleStateCopyWithImpl(this._self, this._then);

  final _VehicleState _self;
  final $Res Function(_VehicleState) _then;

/// Create a copy of VehicleState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vehicleUiModel = freezed,}) {
  return _then(_VehicleState(
vehicleUiModel: freezed == vehicleUiModel ? _self.vehicleUiModel : vehicleUiModel // ignore: cast_nullable_to_non_nullable
as VehicleUiModel?,
  ));
}

/// Create a copy of VehicleState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleUiModelCopyWith<$Res>? get vehicleUiModel {
    if (_self.vehicleUiModel == null) {
    return null;
  }

  return $VehicleUiModelCopyWith<$Res>(_self.vehicleUiModel!, (value) {
    return _then(_self.copyWith(vehicleUiModel: value));
  });
}
}

// dart format on
