import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/common/margin_constant.dart';

class MarginBottom extends StatelessWidget {
  const MarginBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: MarginConstant.marginBottom.h);
  }
}
