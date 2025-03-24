import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/app_color.dart';
import '../../../common/screens/base_screen.dart';
import '../widgets/home_content.dart';
import '../widgets/home_decoration.dart';
import '../widgets/home_drawer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseScreen(
      horizontalPadding: 0,
      drawer: HomeDrawer(),
      child: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Stack(
          fit: StackFit.expand,
          children: [
            HomeDecoration(
              top: 10.h,
              right: -30.w,
              size: 200,
              color: AppColor.primary(context),
            ),
            HomeDecoration(
              bottom: 20.h,
              left: -60.w,
              size: 200,
              color: AppColor.primary(context),
            ),
            HomeContent(),
          ],
        ),
      ),
    );
  }
}
