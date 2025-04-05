import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/route_name.dart';
import '../../../../core/utils/get_logo_asset_util.dart';
import '../view_models/init_state.dart';
import '../view_models/init_view_model.dart';
import 'base_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  bool _hasListened = false;

  @override
  Widget build(BuildContext context) {
    final imageSize = 120.w;
    final logoAsset = GetLogoAssetUtil.of(context);

    if (!_hasListened) {
      _hasListened = true;

      ref.listen<AsyncValue<InitState>>(initViewModelProvider, (
        previous,
        next,
      ) {
        next.when(
          data: (initState) {
            initState.isLogin.when(
              data: (isLogin) {
                _goToInitialRoute(isLogin ? RouteName.home : RouteName.login);
              },
              error: (_, __) => _goToInitialRoute(RouteName.login),
              loading: () {},
            );
          },
          error: (_, __) => _goToInitialRoute(RouteName.login),
          loading: () {},
        );
      });
    }

    return BaseScreen(
      horizontalPadding: 0,
      resizeToAvoidBottomInset: true,
      child: Center(
        child: Image.asset(logoAsset, height: imageSize, width: imageSize),
      ),
    );
  }

  void _goToInitialRoute(String routeName) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
    });
  }
}
