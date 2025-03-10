import 'package:flutter/material.dart';

import '../../my_app.dart';
import 'route_name.dart';

class RouteGenerator {
  const RouteGenerator._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    //   const int duration = 300;
    //   const Curve curve = Curves.easeIn;
    switch (settings.name) {
      case RouteName.login:
        return MaterialPageRoute(builder: (context) => const MyApp());
      default:
        return MaterialPageRoute(builder: (context) => const MyApp());
    }
  }
}
