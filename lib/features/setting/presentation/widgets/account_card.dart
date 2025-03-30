import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/assets/icon_asset_constant.dart';
import '../../../../core/utils/lang.dart';
import '../../../common/widgets/svg_asset.dart';
import '../models/setting_item_model.dart';
import 'base_setting_card.dart';

class AccountCard extends ConsumerWidget {
  const AccountCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<SettingItemModel> settingItemList = [
      SettingItemModel(
        name: Lang.of(context).updatePassword,
        suffixWidget: SvgAsset(asset: IconAssetConstant.arrowForward, size: 20),
      ),
    ];

    return BaseSettingCard(
      label: Lang.of(context).account,
      settingItemList: settingItemList,
    );
  }
}
