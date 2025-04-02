import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parky/core/styles/colors/app_color.dart';
import 'package:parky/core/styles/fonts/app_font.dart';
import 'package:parky/core/utils/lang.dart';

class RememberMe extends ConsumerStatefulWidget {
  const RememberMe({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RememberMeState();
}

class _RememberMeState extends ConsumerState<RememberMe> {
  bool isChecked = false;

  void _toggleChechBox() => setState(() => isChecked = !isChecked);
  @override
  Widget build(BuildContext context) {
    final double checkBoxSize = 20.w;
    return GestureDetector(
      onTap: () => _toggleChechBox(),
      child: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: Row(
          spacing: 10.w,
          children: [
            Container(
              height: checkBoxSize,
              width: checkBoxSize,
              decoration: BoxDecoration(
                border: Border.all(
                  width: isChecked ? 0 : 0.5.w,
                  color: AppColor.onBackgroundApp(context),
                ),
                borderRadius: BorderRadius.circular(5.r),
                color:
                    isChecked ? AppColor.primary(context) : Colors.transparent,
              ),
              child:
                  isChecked
                      ? Icon(
                        Icons.check_rounded,
                        color: AppColor.onPrimary(context),
                        size: 15.r,
                      )
                      : SizedBox.shrink(),
            ),
            Text(
              Lang.of(context).rememberMe,
              style: AppFont.labelMedium(context),
            ),
          ],
        ),
      ),
    );
  }
}
