import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/route_name.dart';
import '../../../../core/utils/get_logo_asset_util.dart';
import '../view_models/init_view_model.dart';
import 'base_screen.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageSize = 120.w;

    final logoAsset = GetLogoAssetUtil.of(context);

    _listenInitialRoute(context, ref);

    return BaseScreen(
      horizontalPadding: 0,
      resizeToAvoidBottomInset: true,
      child: Center(
        child: Image.asset(logoAsset, height: imageSize, width: imageSize),
      ),
    );
  }

  void _listenInitialRoute(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<bool>>(initViewModelProvider, (previous, next) {
      next.when(
        data: (data) {
          _goToInitialRoute(context, data ? RouteName.home : RouteName.login);
        },
        error: (_, __) {
          _goToInitialRoute(context, RouteName.login);
        },
        loading: () {},
      );
    });
  }

  void _goToInitialRoute(BuildContext context, String routeName) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacementNamed(context, routeName);
    });
  }
}
