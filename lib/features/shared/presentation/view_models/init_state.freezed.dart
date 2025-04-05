// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'init_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InitState {

 AsyncValue<bool> get isLogin; AsyncValue<UserUiModel?> get userUiModel;
/// Create a copy of InitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitStateCopyWith<InitState> get copyWith => _$InitStateCopyWithImpl<InitState>(this as InitState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitState&&(identical(other.isLogin, isLogin) || other.isLogin == isLogin)&&(identical(other.userUiModel, userUiModel) || other.userUiModel == userUiModel));
}


@override
int get hashCode => Object.hash(runtimeType,isLogin,userUiModel);

@override
String toString() {
  return 'InitState(isLogin: $isLogin, userUiModel: $userUiModel)';
}


}

/// @nodoc
abstract mixin class $InitStateCopyWith<$Res>  {
  factory $InitStateCopyWith(InitState value, $Res Function(InitState) _then) = _$InitStateCopyWithImpl;
@useResult
$Res call({
 AsyncValue<bool> isLogin, AsyncValue<UserUiModel?> userUiModel
});




}
/// @nodoc
class _$InitStateCopyWithImpl<$Res>
    implements $InitStateCopyWith<$Res> {
  _$InitStateCopyWithImpl(this._self, this._then);

  final InitState _self;
  final $Res Function(InitState) _then;

/// Create a copy of InitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLogin = null,Object? userUiModel = null,}) {
  return _then(_self.copyWith(
isLogin: null == isLogin ? _self.isLogin : isLogin // ignore: cast_nullable_to_non_nullable
as AsyncValue<bool>,userUiModel: null == userUiModel ? _self.userUiModel : userUiModel // ignore: cast_nullable_to_non_nullable
as AsyncValue<UserUiModel?>,
  ));
}

}


/// @nodoc


class _InitState implements InitState {
  const _InitState({this.isLogin = const AsyncValue<bool>.data(false), this.userUiModel = const AsyncValue<UserUiModel?>.data(null)});
  

@override@JsonKey() final  AsyncValue<bool> isLogin;
@override@JsonKey() final  AsyncValue<UserUiModel?> userUiModel;

/// Create a copy of InitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitStateCopyWith<_InitState> get copyWith => __$InitStateCopyWithImpl<_InitState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitState&&(identical(other.isLogin, isLogin) || other.isLogin == isLogin)&&(identical(other.userUiModel, userUiModel) || other.userUiModel == userUiModel));
}


@override
int get hashCode => Object.hash(runtimeType,isLogin,userUiModel);

@override
String toString() {
  return 'InitState(isLogin: $isLogin, userUiModel: $userUiModel)';
}


}

/// @nodoc
abstract mixin class _$InitStateCopyWith<$Res> implements $InitStateCopyWith<$Res> {
  factory _$InitStateCopyWith(_InitState value, $Res Function(_InitState) _then) = __$InitStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncValue<bool> isLogin, AsyncValue<UserUiModel?> userUiModel
});




}
/// @nodoc
class __$InitStateCopyWithImpl<$Res>
    implements _$InitStateCopyWith<$Res> {
  __$InitStateCopyWithImpl(this._self, this._then);

  final _InitState _self;
  final $Res Function(_InitState) _then;

/// Create a copy of InitState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLogin = null,Object? userUiModel = null,}) {
  return _then(_InitState(
isLogin: null == isLogin ? _self.isLogin : isLogin // ignore: cast_nullable_to_non_nullable
as AsyncValue<bool>,userUiModel: null == userUiModel ? _self.userUiModel : userUiModel // ignore: cast_nullable_to_non_nullable
as AsyncValue<UserUiModel?>,
  ));
}


}

// dart format on
