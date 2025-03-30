import 'package:flutter/material.dart';
import 'package:parky/features/auth/presentation/screens/login_screen.dart';
import 'package:parky/features/setting/presentation/pages/setting_screen.dart';
import 'package:parky/features/user_parking/presentation/screens/home_screen.dart';

import '../utils/slide_horizontal.dart';
import 'route_name.dart';

class RouteGenerator {
  const RouteGenerator._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.login:
        return SlideHorizontal(
          page: LoginScreen(),
          settings: RouteSettings(name: RouteName.login),
        );
      case RouteName.home:
        return SlideHorizontal(
          page: HomeScreen(),
          settings: RouteSettings(name: RouteName.home),
        );
      case RouteName.setting:
        return SlideHorizontal(
          page: SettingScreen(),
          settings: RouteSettings(name: RouteName.setting),
        );
      default:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
    }
  }
}
