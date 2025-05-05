// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottom_navbar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BottomNavbarState {

 int get selectedTabIndex; bool get isBottomNavVisible;
/// Create a copy of BottomNavbarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BottomNavbarStateCopyWith<BottomNavbarState> get copyWith => _$BottomNavbarStateCopyWithImpl<BottomNavbarState>(this as BottomNavbarState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BottomNavbarState&&(identical(other.selectedTabIndex, selectedTabIndex) || other.selectedTabIndex == selectedTabIndex)&&(identical(other.isBottomNavVisible, isBottomNavVisible) || other.isBottomNavVisible == isBottomNavVisible));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTabIndex,isBottomNavVisible);

@override
String toString() {
  return 'BottomNavbarState(selectedTabIndex: $selectedTabIndex, isBottomNavVisible: $isBottomNavVisible)';
}


}

/// @nodoc
abstract mixin class $BottomNavbarStateCopyWith<$Res>  {
  factory $BottomNavbarStateCopyWith(BottomNavbarState value, $Res Function(BottomNavbarState) _then) = _$BottomNavbarStateCopyWithImpl;
@useResult
$Res call({
 int selectedTabIndex, bool isBottomNavVisible
});




}
/// @nodoc
class _$BottomNavbarStateCopyWithImpl<$Res>
    implements $BottomNavbarStateCopyWith<$Res> {
  _$BottomNavbarStateCopyWithImpl(this._self, this._then);

  final BottomNavbarState _self;
  final $Res Function(BottomNavbarState) _then;

/// Create a copy of BottomNavbarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTabIndex = null,Object? isBottomNavVisible = null,}) {
  return _then(_self.copyWith(
selectedTabIndex: null == selectedTabIndex ? _self.selectedTabIndex : selectedTabIndex // ignore: cast_nullable_to_non_nullable
as int,isBottomNavVisible: null == isBottomNavVisible ? _self.isBottomNavVisible : isBottomNavVisible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _BottomNavbarState implements BottomNavbarState {
  const _BottomNavbarState({required this.selectedTabIndex, required this.isBottomNavVisible});
  

@override final  int selectedTabIndex;
@override final  bool isBottomNavVisible;

/// Create a copy of BottomNavbarState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BottomNavbarStateCopyWith<_BottomNavbarState> get copyWith => __$BottomNavbarStateCopyWithImpl<_BottomNavbarState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BottomNavbarState&&(identical(other.selectedTabIndex, selectedTabIndex) || other.selectedTabIndex == selectedTabIndex)&&(identical(other.isBottomNavVisible, isBottomNavVisible) || other.isBottomNavVisible == isBottomNavVisible));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTabIndex,isBottomNavVisible);

@override
String toString() {
  return 'BottomNavbarState(selectedTabIndex: $selectedTabIndex, isBottomNavVisible: $isBottomNavVisible)';
}


}

/// @nodoc
abstract mixin class _$BottomNavbarStateCopyWith<$Res> implements $BottomNavbarStateCopyWith<$Res> {
  factory _$BottomNavbarStateCopyWith(_BottomNavbarState value, $Res Function(_BottomNavbarState) _then) = __$BottomNavbarStateCopyWithImpl;
@override @useResult
$Res call({
 int selectedTabIndex, bool isBottomNavVisible
});




}
/// @nodoc
class __$BottomNavbarStateCopyWithImpl<$Res>
    implements _$BottomNavbarStateCopyWith<$Res> {
  __$BottomNavbarStateCopyWithImpl(this._self, this._then);

  final _BottomNavbarState _self;
  final $Res Function(_BottomNavbarState) _then;

/// Create a copy of BottomNavbarState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTabIndex = null,Object? isBottomNavVisible = null,}) {
  return _then(_BottomNavbarState(
selectedTabIndex: null == selectedTabIndex ? _self.selectedTabIndex : selectedTabIndex // ignore: cast_nullable_to_non_nullable
as int,isBottomNavVisible: null == isBottomNavVisible ? _self.isBottomNavVisible : isBottomNavVisible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
