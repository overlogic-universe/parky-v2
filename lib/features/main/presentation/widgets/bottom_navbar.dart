import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/assets/icon_asset_constant.dart';
import '../../../../core/constants/common/size_constant.dart';
import '../../../../core/styles/colors/app_color.dart';
import '../../../shared/presentation/widgets/svg_asset.dart';
import '../view_models/bottom_navbar_view_model.dart';
import '../view_models/tab_model.dart';

class BottomNavbar extends ConsumerStatefulWidget {
  const BottomNavbar({super.key});

  @override
  ConsumerState<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends ConsumerState<BottomNavbar> {
  late List<TabModel> tabModels;

  final botNavWidth = 150;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tabModels = [
      TabModel(icon: IconAssetConstant.home),
      TabModel(icon: IconAssetConstant.parkingBuilding),
      TabModel(icon: IconAssetConstant.setting),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bottomNavbarViewModelProvider);
    final isVisible = state.isBottomNavVisible;
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      bottom: isVisible ? 10.h : (-SizeConstant.bottomNavbarHeight),
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: 1.sw - botNavWidth.w,
        height: SizeConstant.bottomNavbarHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: AppColor.backgroundApp(context),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadow(context),
              blurRadius: 10.r,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: List.generate(
            tabModels.length,
            (index) => Consumer(
              builder:
                  (context, ref, child) =>
                      _buildBotNavItem(context, index, ref),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBotNavItem(BuildContext context, int index, WidgetRef ref) {
    final viewModel = ref.read(bottomNavbarViewModelProvider.notifier);
    final state = ref.watch(bottomNavbarViewModelProvider);
    final isSelectedIndex = state.selectedTabIndex == index;
    final item = tabModels[index];
    return GestureDetector(
      onTap: () => viewModel.selectTab(index),
      child: Container(
        height: SizeConstant.bottomNavbarHeight,
        width: 1.sw / tabModels.length - botNavWidth.w / tabModels.length,
        color: AppColor.backgroundApp(context),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10.r),
            child: SvgAsset(
              asset: item.icon,
              color:
                  isSelectedIndex
                      ? AppColor.primary(context)
                      : AppColor.disableTextOrIcon(context),
            ),
          ),
        ),
      ),
    );
  }
}
