import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/lang.dart';
import '../models/setting_item_model.dart';
import 'base_setting_card.dart';

class AccountCard extends ConsumerWidget {
  const AccountCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<SettingItemModel> settingItemList = [
      SettingItemModel(name: Lang.of(context).updatePassword),
    ];

    return BaseSettingCard(
      onTap: (item) => _handleSelectItem(context, item),
      label: Lang.of(context).account,
      settingItemList: settingItemList,
    );
  }

  void _handleSelectItem(BuildContext context, SettingItemModel item) {
    final name = item.name;
    if (name == Lang.of(context).updatePassword) {
      
    }
  }
}
