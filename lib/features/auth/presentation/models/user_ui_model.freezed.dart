// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserUiModel {

 String get id; String get studentId; String get name; String get email;
/// Create a copy of UserUiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserUiModelCopyWith<UserUiModel> get copyWith => _$UserUiModelCopyWithImpl<UserUiModel>(this as UserUiModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserUiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,id,studentId,name,email);

@override
String toString() {
  return 'UserUiModel(id: $id, studentId: $studentId, name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class $UserUiModelCopyWith<$Res>  {
  factory $UserUiModelCopyWith(UserUiModel value, $Res Function(UserUiModel) _then) = _$UserUiModelCopyWithImpl;
@useResult
$Res call({
 String id, String studentId, String name, String email
});




}
/// @nodoc
class _$UserUiModelCopyWithImpl<$Res>
    implements $UserUiModelCopyWith<$Res> {
  _$UserUiModelCopyWithImpl(this._self, this._then);

  final UserUiModel _self;
  final $Res Function(UserUiModel) _then;

/// Create a copy of UserUiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? studentId = null,Object? name = null,Object? email = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _UserUiModel implements UserUiModel {
  const _UserUiModel({required this.id, required this.studentId, required this.name, required this.email});
  

@override final  String id;
@override final  String studentId;
@override final  String name;
@override final  String email;

/// Create a copy of UserUiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserUiModelCopyWith<_UserUiModel> get copyWith => __$UserUiModelCopyWithImpl<_UserUiModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserUiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,id,studentId,name,email);

@override
String toString() {
  return 'UserUiModel(id: $id, studentId: $studentId, name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class _$UserUiModelCopyWith<$Res> implements $UserUiModelCopyWith<$Res> {
  factory _$UserUiModelCopyWith(_UserUiModel value, $Res Function(_UserUiModel) _then) = __$UserUiModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String studentId, String name, String email
});




}
/// @nodoc
class __$UserUiModelCopyWithImpl<$Res>
    implements _$UserUiModelCopyWith<$Res> {
  __$UserUiModelCopyWithImpl(this._self, this._then);

  final _UserUiModel _self;
  final $Res Function(_UserUiModel) _then;

/// Create a copy of UserUiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? studentId = null,Object? name = null,Object? email = null,}) {
  return _then(_UserUiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
