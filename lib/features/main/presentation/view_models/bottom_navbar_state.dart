import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_navbar_state.freezed.dart';

@freezed
abstract class BottomNavbarState with _$BottomNavbarState {
  const factory BottomNavbarState({
    required int selectedTabIndex,
    required bool isBottomNavVisible,
  }) = _BottomNavbarState;
}
