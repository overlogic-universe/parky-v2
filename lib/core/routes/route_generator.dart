import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/login_screen.dart';
import '../../features/main/presentation/pages/main_screen.dart';
import '../../features/parking_lot/domain/entities/parking_lot_entity.dart';
import '../../features/parking_lot/presentation/pages/parking_lot_map.dart';
import '../../features/shared/presentation/pages/splash_screen.dart';
import 'route_name.dart';

class RouteGenerator {
  const RouteGenerator._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case RouteName.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      case RouteName.main:
        return MaterialPageRoute(builder: (context) => const MainScreen());

      case RouteName.parkingLotMap:
        final parkingLot = settings.arguments as ParkingLotEntity;
        return MaterialPageRoute(
          builder: (context) => ParkingLotMapScreen(parkingLot: parkingLot),
        );

      // TODO: Menambahkan halaman sesuai dengan route name

      default:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
    }
  }
}
