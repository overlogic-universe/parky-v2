import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../student_parking/presentation/view_models/vehicle_view_model.dart';
import '../../../shared/presentation/pages/base_screen.dart';
import '../../../shared/presentation/view_models/init_view_model.dart';
import '../../../student_parking/presentation/view_models/park_view_model.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/tab_bar_view_widget.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => _initialize());
  }

  void _initialize() {
    final state = ref.read(initViewModelProvider);
    final alreadyHasStudent = state.whenOrNull(data: (d) => d.student != null);

    if (alreadyHasStudent != true) {
      ref.read(initViewModelProvider.notifier).getStudentEntity();
    }

    ref.read(parkViewModelProvider.notifier).fetch();
    ref.read(vehicleViewModelProvider.notifier).fetch();
  }

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      horizontalPadding: 0,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [TabBarViewWidget(), BottomNavbar()],
      ),
    );
  }
}
