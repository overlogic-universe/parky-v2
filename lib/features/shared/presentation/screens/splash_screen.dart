import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/assets/image_asset_constant.dart';
import 'base_screen.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageSize = 100.w;

    final brightness = Theme.of(context).brightness;

    final logoAsset =
        brightness == Brightness.dark
            ? ImageAssetConstant.appLogoWhite
            : ImageAssetConstant.appLogo;

    return BaseScreen(
      horizontalPadding: 0,
      resizeToAvoidBottomInset: true,
      child: Center(
        child: Image.asset(logoAsset, height: imageSize, width: imageSize),
      ),
    );
  }
}
