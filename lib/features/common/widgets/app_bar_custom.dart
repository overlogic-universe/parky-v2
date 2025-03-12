import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/common/size_constant.dart';
import '../../../../core/styles/colors/app_color.dart';
import 'line.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final Color? backgroundColor;
  final bool shownBottomLine;
  final bool showBackIcon;
  const AppBarCustom(
      {super.key,
      required this.title,
      this.backgroundColor,
      this.shownBottomLine = false,
      this.showBackIcon = true});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          backgroundColor ?? AppColor.containerColorBackgroundApp(context),
      title: title,
      bottom: shownBottomLine
          ? PreferredSize(
              preferredSize: Size.fromHeight(1),
              child: Line(),
            )
          : null,
      leadingWidth: showBackIcon ? SizeConstant.leadingWidth.w : 0,
      leading: showBackIcon
          ? GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios_rounded),
            )
          : SizedBox.shrink(),
    );
  }
}
