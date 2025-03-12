import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/common/margin_constant.dart';

class BaseScreen extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget child;
  final bool resizeToAvoidBottomInset;
  final double? horizontalPadding;
  final bool useSafeArea;
  const BaseScreen({
    super.key,
    this.appBar,
    required this.child,
    this.resizeToAvoidBottomInset = false,
    this.horizontalPadding,
    this.useSafeArea = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: appBar,
      body: useSafeArea ? SafeArea(child: _buildBody()) : _buildBody(),
    );
  }

  Container _buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? MarginConstant.horizontalScreen,
      ),
      width: 1.sw,
      child: child,
    );
  }
}
