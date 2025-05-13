// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StudentEntity {

 String get id; String get nim; String get name; String get email; String? get password;
/// Create a copy of StudentEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentEntityCopyWith<StudentEntity> get copyWith => _$StudentEntityCopyWithImpl<StudentEntity>(this as StudentEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.nim, nim) || other.nim == nim)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,id,nim,name,email,password);

@override
String toString() {
  return 'StudentEntity(id: $id, nim: $nim, name: $name, email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $StudentEntityCopyWith<$Res>  {
  factory $StudentEntityCopyWith(StudentEntity value, $Res Function(StudentEntity) _then) = _$StudentEntityCopyWithImpl;
@useResult
$Res call({
 String id, String nim, String name, String email, String? password
});




}
/// @nodoc
class _$StudentEntityCopyWithImpl<$Res>
    implements $StudentEntityCopyWith<$Res> {
  _$StudentEntityCopyWithImpl(this._self, this._then);

  final StudentEntity _self;
  final $Res Function(StudentEntity) _then;

/// Create a copy of StudentEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nim = null,Object? name = null,Object? email = null,Object? password = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nim: null == nim ? _self.nim : nim // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _StudentEntity implements StudentEntity {
  const _StudentEntity({required this.id, required this.nim, required this.name, required this.email, this.password = null});
  

@override final  String id;
@override final  String nim;
@override final  String name;
@override final  String email;
@override@JsonKey() final  String? password;

/// Create a copy of StudentEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentEntityCopyWith<_StudentEntity> get copyWith => __$StudentEntityCopyWithImpl<_StudentEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.nim, nim) || other.nim == nim)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,id,nim,name,email,password);

@override
String toString() {
  return 'StudentEntity(id: $id, nim: $nim, name: $name, email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$StudentEntityCopyWith<$Res> implements $StudentEntityCopyWith<$Res> {
  factory _$StudentEntityCopyWith(_StudentEntity value, $Res Function(_StudentEntity) _then) = __$StudentEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String nim, String name, String email, String? password
});




}
/// @nodoc
class __$StudentEntityCopyWithImpl<$Res>
    implements _$StudentEntityCopyWith<$Res> {
  __$StudentEntityCopyWithImpl(this._self, this._then);

  final _StudentEntity _self;
  final $Res Function(_StudentEntity) _then;

/// Create a copy of StudentEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nim = null,Object? name = null,Object? email = null,Object? password = freezed,}) {
  return _then(_StudentEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nim: null == nim ? _self.nim : nim // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
