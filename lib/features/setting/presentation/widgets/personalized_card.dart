import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/lang.dart';
import '../models/setting_item_model.dart';
import 'base_setting_card.dart';

class PersonalizedCard extends ConsumerWidget {
  const PersonalizedCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<SettingItemModel> settingItemList = [
      SettingItemModel(
        name: Lang.of(context).chooseTheme,
        suffixWidget: DropdownButton(items: [], onChanged: (value) {}),
      ),
      SettingItemModel(
        name: Lang.of(context).chooseLanguage,
        suffixWidget: DropdownButton(items: [], onChanged: (value) {}),
      ),
    ];

    return BaseSettingCard(
      label: Lang.of(context).personalized,
      settingItemList: settingItemList,
    );
  }
}
