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

 bool get isLogin; StudentEntity? get student;
/// Create a copy of InitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitStateCopyWith<InitState> get copyWith => _$InitStateCopyWithImpl<InitState>(this as InitState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitState&&(identical(other.isLogin, isLogin) || other.isLogin == isLogin)&&(identical(other.student, student) || other.student == student));
}


@override
int get hashCode => Object.hash(runtimeType,isLogin,student);

@override
String toString() {
  return 'InitState(isLogin: $isLogin, student: $student)';
}


}

/// @nodoc
abstract mixin class $InitStateCopyWith<$Res>  {
  factory $InitStateCopyWith(InitState value, $Res Function(InitState) _then) = _$InitStateCopyWithImpl;
@useResult
$Res call({
 bool isLogin, StudentEntity? student
});


$StudentEntityCopyWith<$Res>? get student;

}
/// @nodoc
class _$InitStateCopyWithImpl<$Res>
    implements $InitStateCopyWith<$Res> {
  _$InitStateCopyWithImpl(this._self, this._then);

  final InitState _self;
  final $Res Function(InitState) _then;

/// Create a copy of InitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLogin = null,Object? student = freezed,}) {
  return _then(_self.copyWith(
isLogin: null == isLogin ? _self.isLogin : isLogin // ignore: cast_nullable_to_non_nullable
as bool,student: freezed == student ? _self.student : student // ignore: cast_nullable_to_non_nullable
as StudentEntity?,
  ));
}
/// Create a copy of InitState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudentEntityCopyWith<$Res>? get student {
    if (_self.student == null) {
    return null;
  }

  return $StudentEntityCopyWith<$Res>(_self.student!, (value) {
    return _then(_self.copyWith(student: value));
  });
}
}


/// @nodoc


class _InitState implements InitState {
  const _InitState({required this.isLogin, this.student});
  

@override final  bool isLogin;
@override final  StudentEntity? student;

/// Create a copy of InitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitStateCopyWith<_InitState> get copyWith => __$InitStateCopyWithImpl<_InitState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitState&&(identical(other.isLogin, isLogin) || other.isLogin == isLogin)&&(identical(other.student, student) || other.student == student));
}


@override
int get hashCode => Object.hash(runtimeType,isLogin,student);

@override
String toString() {
  return 'InitState(isLogin: $isLogin, student: $student)';
}


}

/// @nodoc
abstract mixin class _$InitStateCopyWith<$Res> implements $InitStateCopyWith<$Res> {
  factory _$InitStateCopyWith(_InitState value, $Res Function(_InitState) _then) = __$InitStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLogin, StudentEntity? student
});


@override $StudentEntityCopyWith<$Res>? get student;

}
/// @nodoc
class __$InitStateCopyWithImpl<$Res>
    implements _$InitStateCopyWith<$Res> {
  __$InitStateCopyWithImpl(this._self, this._then);

  final _InitState _self;
  final $Res Function(_InitState) _then;

/// Create a copy of InitState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLogin = null,Object? student = freezed,}) {
  return _then(_InitState(
isLogin: null == isLogin ? _self.isLogin : isLogin // ignore: cast_nullable_to_non_nullable
as bool,student: freezed == student ? _self.student : student // ignore: cast_nullable_to_non_nullable
as StudentEntity?,
  ));
}

/// Create a copy of InitState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudentEntityCopyWith<$Res>? get student {
    if (_self.student == null) {
    return null;
  }

  return $StudentEntityCopyWith<$Res>(_self.student!, (value) {
    return _then(_self.copyWith(student: value));
  });
}
}

// dart format on
