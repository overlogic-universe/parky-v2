import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/assets/icon_asset_constant.dart';
import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/utils/lang.dart';
import '../../../shared/presentation/widgets/svg_asset.dart';
import '../../../user_parking/presentation/widgets/logout_alert_dialog.dart';
import '../models/setting_item_model.dart';
import 'base_setting_card.dart';

class AuthenticationCard extends ConsumerWidget {
  const AuthenticationCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<SettingItemModel> settingItemList = [
      SettingItemModel(
        name: Lang.of(context).logout,
        suffixWidget: SvgAsset(
          asset: IconAssetConstant.logout,
          color: AppColor.error(context),
        ),
      ),
    ];

    return BaseSettingCard(
      onTap:
          (item) => showDialog(
            context: context,
            builder: (context) => LogoutAlertDialog(),
          ),
      label: Lang.of(context).authentication,
      settingItemList: settingItemList,
      textColor: AppColor.error(context),
    );
  }
}
