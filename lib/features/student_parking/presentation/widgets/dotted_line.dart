import 'package:flutter/material.dart';
import 'package:parky/core/styles/colors/app_color.dart';

class DottedLine extends StatelessWidget {
  const DottedLine({super.key, this.height = 2, this.color});
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: color ?? AppColor.backgroundApp(context),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
