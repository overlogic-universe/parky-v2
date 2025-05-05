import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'bottom_navbar_state.dart';

part 'bottom_navbar_view_model.g.dart';

@riverpod
class BottomNavbarViewModel extends _$BottomNavbarViewModel {
  @override
  BottomNavbarState build() {
    return BottomNavbarState(selectedTabIndex: 0);
  }

  void selectTab(int index) {
    state = state.copyWith(selectedTabIndex: index);
  }
}
