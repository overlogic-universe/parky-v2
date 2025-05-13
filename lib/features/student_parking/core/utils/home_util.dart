import 'package:flutter/material.dart';

import '../../../../core/utils/lang.dart';

class HomeUtil {
  const HomeUtil._();

  static String getHomeGreeting(BuildContext context) {
    final hour = DateTime.now().hour;

    String timeOfDay;
    if (hour >= 5 && hour < 12) {
      timeOfDay = Lang.of(context).morning;
    } else if (hour >= 12 && hour < 17) {
      timeOfDay = Lang.of(context).afternoon;
    } else if (hour >= 17 && hour < 21) {
      timeOfDay = Lang.of(context).evening;
    } else {
      timeOfDay = Lang.of(context).night;
    }

    return Lang.of(context).homeGreeting(timeOfDay);
  }

  static String getMiddleName(String fullName) {
    final parts = fullName.trim().split(' ');

    switch (parts.length) {
      case 1:
        return parts.first;
      case 2:
        return parts.first;
      case 3:
        return parts[1];
      default:
        return parts.first;
    }
  }
}
