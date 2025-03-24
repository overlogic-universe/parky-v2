import 'package:flutter/material.dart';

class SlideHorizontal<T> extends PageRouteBuilder<T> {
  final Widget page;

  SlideHorizontal({required this.page, required super.settings})
    : super(
        transitionDuration: const Duration(milliseconds: 300),
        reverseTransitionDuration: const Duration(milliseconds: 300),
        pageBuilder:
            (
              BuildContext context,
              Animation<double> animation1,
              Animation<double> animation2,
            ) => page,
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation1,
          Animation<double> animation2,
          Widget page,
        ) {
          final CurvedAnimation curvedAnimation = CurvedAnimation(
            parent: animation1,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeIn,
          );

          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(curvedAnimation),
            child: page,
          );
        },
      );
}
