import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'bottom_navbar_state.dart';

part 'bottom_navbar_view_model.g.dart';

@riverpod
class BottomNavbarViewModel extends _$BottomNavbarViewModel {
  @override
  BottomNavbarState build() {
    return const BottomNavbarState(
      selectedTabIndex: 0,
      isBottomNavVisible: true,
    );
  }

  void selectTab(int index) {
    state = state.copyWith(selectedTabIndex: index);
  }

  void setBottomNavVisibility(bool isVisible) {
    if (state.isBottomNavVisible != isVisible) {
      state = state.copyWith(isBottomNavVisible: isVisible);
    }
  }
}

