import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parky/features/setting/presentation/widgets/account_card.dart';

import '../../../../core/constants/common/margin_constant.dart';
import '../../../../core/utils/lang.dart';
import '../../../common/screens/base_screen_with_decoration.dart';
import '../../../common/widgets/app_bar_custom.dart';
import '../widgets/personalized_card.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreenWithDecoration(
      horizontalPadding: 0,
      appBar: AppBarCustom(title: Text(Lang.of(context).setting)),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MarginConstant.horizontalScreen,
          ),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              AccountCard(),
              SizedBox(height: 10.h),
              PersonalizedCard(),
              SizedBox(height: MarginConstant.marginBottom.h),
            ],
          ),
        ),
      ),
    );
  }
}
