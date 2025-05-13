import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../main/presentation/view_models/bottom_navbar_view_model.dart';

class ScrollUtil {
  static void attachBottomNavbarVisibilityListener({
    required ScrollController controller,
    required WidgetRef ref,
  }) {
    controller.addListener(() {
      final direction = controller.position.userScrollDirection;
      final isDown = direction == ScrollDirection.reverse;
      final isUp = direction == ScrollDirection.forward;

      final vm = ref.read(bottomNavbarViewModelProvider.notifier);

      if (isDown) {
        vm.setBottomNavVisibility(false);
      } else if (isUp) {
        vm.setBottomNavVisibility(true);
      }
    });
  }
}
