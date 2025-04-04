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

 ParkUiModel? get parkUiModel;
/// Create a copy of ParkState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParkStateCopyWith<ParkState> get copyWith => _$ParkStateCopyWithImpl<ParkState>(this as ParkState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParkState&&(identical(other.parkUiModel, parkUiModel) || other.parkUiModel == parkUiModel));
}


@override
int get hashCode => Object.hash(runtimeType,parkUiModel);

@override
String toString() {
  return 'ParkState(parkUiModel: $parkUiModel)';
}


}

/// @nodoc
abstract mixin class $ParkStateCopyWith<$Res>  {
  factory $ParkStateCopyWith(ParkState value, $Res Function(ParkState) _then) = _$ParkStateCopyWithImpl;
@useResult
$Res call({
 ParkUiModel? parkUiModel
});


$ParkUiModelCopyWith<$Res>? get parkUiModel;

}
/// @nodoc
class _$ParkStateCopyWithImpl<$Res>
    implements $ParkStateCopyWith<$Res> {
  _$ParkStateCopyWithImpl(this._self, this._then);

  final ParkState _self;
  final $Res Function(ParkState) _then;

/// Create a copy of ParkState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? parkUiModel = freezed,}) {
  return _then(_self.copyWith(
parkUiModel: freezed == parkUiModel ? _self.parkUiModel : parkUiModel // ignore: cast_nullable_to_non_nullable
as ParkUiModel?,
  ));
}
/// Create a copy of ParkState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParkUiModelCopyWith<$Res>? get parkUiModel {
    if (_self.parkUiModel == null) {
    return null;
  }

  return $ParkUiModelCopyWith<$Res>(_self.parkUiModel!, (value) {
    return _then(_self.copyWith(parkUiModel: value));
  });
}
}


/// @nodoc


class _ParkState implements ParkState {
  const _ParkState({this.parkUiModel = null});
  

@override@JsonKey() final  ParkUiModel? parkUiModel;

/// Create a copy of ParkState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParkStateCopyWith<_ParkState> get copyWith => __$ParkStateCopyWithImpl<_ParkState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParkState&&(identical(other.parkUiModel, parkUiModel) || other.parkUiModel == parkUiModel));
}


@override
int get hashCode => Object.hash(runtimeType,parkUiModel);

@override
String toString() {
  return 'ParkState(parkUiModel: $parkUiModel)';
}


}

/// @nodoc
abstract mixin class _$ParkStateCopyWith<$Res> implements $ParkStateCopyWith<$Res> {
  factory _$ParkStateCopyWith(_ParkState value, $Res Function(_ParkState) _then) = __$ParkStateCopyWithImpl;
@override @useResult
$Res call({
 ParkUiModel? parkUiModel
});


@override $ParkUiModelCopyWith<$Res>? get parkUiModel;

}
/// @nodoc
class __$ParkStateCopyWithImpl<$Res>
    implements _$ParkStateCopyWith<$Res> {
  __$ParkStateCopyWithImpl(this._self, this._then);

  final _ParkState _self;
  final $Res Function(_ParkState) _then;

/// Create a copy of ParkState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? parkUiModel = freezed,}) {
  return _then(_ParkState(
parkUiModel: freezed == parkUiModel ? _self.parkUiModel : parkUiModel // ignore: cast_nullable_to_non_nullable
as ParkUiModel?,
  ));
}

/// Create a copy of ParkState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParkUiModelCopyWith<$Res>? get parkUiModel {
    if (_self.parkUiModel == null) {
    return null;
  }

  return $ParkUiModelCopyWith<$Res>(_self.parkUiModel!, (value) {
    return _then(_self.copyWith(parkUiModel: value));
  });
}
}

// dart format on
