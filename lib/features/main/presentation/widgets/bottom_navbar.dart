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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tabModels = [
      TabModel(
        icon: IconAssetConstant.home,
      ),
      TabModel(
        icon: IconAssetConstant.parkingBuilding,
      ),
      TabModel(
        icon: IconAssetConstant.setting,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: SizeConstant.bottomNavbarHeight,
        color: AppColor.backgroundApp(context),
        child: Row(
          children: List.generate(
            tabModels.length,
            (index) => Consumer(
              builder: (context, ref, child) =>
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
        width: 1.sw / tabModels.length,
        color: AppColor.backgroundApp(context),
        child: SvgAsset(
          asset: item.icon,
          color: isSelectedIndex
              ? AppColor.primary(context)
              : AppColor.disableTextOrIcon(context),
        ),
      ),
    );
  }
}
