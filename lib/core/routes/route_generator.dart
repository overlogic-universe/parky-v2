import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/setting/presentation/pages/setting_screen.dart';
import '../../features/shared/presentation/screens/splash_screen.dart';
import '../../features/user_parking/presentation/screens/home_screen.dart';
import 'route_name.dart';

class RouteGenerator {
  const RouteGenerator._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    const int duration = 300;
    const Curve curve = Curves.easeIn;
    switch (settings.name) {
      case RouteName.splashScreen:
        return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: duration),
          curve: curve,
          isIos: true,
        );
        
      case RouteName.login:
        return PageTransition(
          child: const LoginScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: duration),
          curve: curve,
          isIos: true,
        );

      case RouteName.home:
        return PageTransition(
          child: const HomeScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: duration),
          curve: curve,
          isIos: true,
        );

      case RouteName.setting:
        return PageTransition(
          child: const SettingScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: duration),
          curve: curve,
          isIos: true,
        );

      // TODO: Menambahkan halaman sesuai dengan route name

      default:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
    }
  }
}
