import 'package:flutter/material.dart';
import 'package:parky/features/auth/presentation/screens/login_screen.dart';

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
      default:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
    }
  }
}
