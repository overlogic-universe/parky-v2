import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../parking_lot/presentation/pages/parking_lot_tab.dart';
import '../../../setting/presentation/pages/setting_tab.dart';
import '../../../student_parking/presentation/pages/home_tab.dart';
import '../view_models/bottom_navbar_view_model.dart';

class TabBarViewWidget extends ConsumerStatefulWidget {
  const TabBarViewWidget({super.key});

  @override
  ConsumerState<TabBarViewWidget> createState() => _TabBarViewWidgetState();
}

class _TabBarViewWidgetState extends ConsumerState<TabBarViewWidget>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = [HomeTab(), ParkingLotTab(), SettingTab()];
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedTabIndex =
        ref.watch(bottomNavbarViewModelProvider).selectedTabIndex;

    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      viewportFraction: 1,
      controller: _tabController,
      children: List.generate(_tabs.length, (index) => _tabs[selectedTabIndex]),
    );
  }
}
