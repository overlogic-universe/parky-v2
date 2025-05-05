import 'package:flutter/material.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/setting/presentation/pages/setting_screen.dart';
import '../../features/shared/presentation/screens/splash_screen.dart';
import '../../features/user_parking/presentation/screens/home_screen.dart';
import 'route_name.dart';

class RouteGenerator {
  const RouteGenerator._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case RouteName.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      case RouteName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case RouteName.setting:
        return MaterialPageRoute(builder: (context) => const SettingScreen());

      // TODO: Menambahkan halaman sesuai dengan route name

      default:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
    }
  }
}
