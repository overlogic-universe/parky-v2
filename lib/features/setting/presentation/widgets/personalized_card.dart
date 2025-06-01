import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/assets/icon_asset_constant.dart';
import '../../../../core/constants/common/locale_id_constant.dart';
import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/colors/theme_color.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../../../core/utils/lang.dart';
import '../../../shared/presentation/widgets/svg_asset.dart';
import '../models/setting_item_model.dart';
import '../view_models/setting_view_model.dart';
import 'base_setting_card.dart';

class PersonalizedCard extends ConsumerWidget {
  const PersonalizedCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    List<SettingItemModel> settingItemList = [
      SettingItemModel(name: Lang.of(context).chooseTheme),
      SettingItemModel(name: Lang.of(context).chooseLanguage),
    ];

    return BaseSettingCard(
      onTap: (item) => _handleSelectItem(context, ref, item),
      label: Lang.of(context).personalized,
      settingItemList: settingItemList,
    );
  }

  void _handleSelectItem(
    BuildContext context,
    WidgetRef ref,
    SettingItemModel item,
  ) {
    final name = item.name;
    if (name == Lang.of(context).chooseTheme) {
      _handleChooseTheme(context, ref);
    } else if (name == Lang.of(context).chooseLanguage) {
      _handleChooseLanguage(context, ref);
    }
  }

  void _handleChooseLanguage(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingViewModelProvider);
    String? selectedValue = state.maybeWhen(
      data: (data) => data.localeId,
      orElse: () => LocaleIdConstant.ID,
    );

    showDialog(
      context: context,
      builder:
          (context) => _buildPopUp<String>(
            context,
            ref,
            title: Lang.of(context).chooseLanguage,
            description: Lang.of(context).chooseLanguageDesc,
            selectedValue: selectedValue,
            options: [LocaleIdConstant.ID, LocaleIdConstant.EN],
            onChanged: (value) => _onLanguageChange(context, ref, value),
            displayText: (value) => _getDisplayLanguageText(context, value),
          ),
    );
  }

  String _getDisplayLanguageText(BuildContext context, String? value) {
    if (value == LocaleIdConstant.ID) {
      return Lang.of(context).indonesia;
    } else if (value == LocaleIdConstant.EN) {
      return Lang.of(context).english;
    } else {
      return Lang.of(context).indonesia;
    }
  }

  void _handleChooseTheme(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingViewModelProvider);
    ThemeModeType? selectedValue = state.maybeWhen(
      data: (data) => data.themeModeType,
      orElse: () => ThemeModeType.main,
    );

    showDialog(
      context: context,
      builder:
          (context) => _buildPopUp<ThemeModeType>(
            context,
            ref,
            title: Lang.of(context).chooseTheme,
            description: Lang.of(context).chooseThemeDesc,
            selectedValue: selectedValue,
            options: [ThemeModeType.main, ThemeModeType.orb],
            onChanged: (value) => _onThemeChange(context, ref, value),
            displayText: (value) => value.displayName(context),
          ),
    );
  }

  Widget _buildPopUp<T>(
    BuildContext context,
    WidgetRef ref, {
    required String title,
    required String description,
    required T? selectedValue,
    required List<T> options,
    required void Function(T?) onChanged,
    required String Function(T) displayText,
  }) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      content: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: AppFont.titleMedium(context)),
              SizedBox(height: 3.h),
              Text(
                description,
                style: AppFont.labelSmall(
                  context,
                )?.copyWith(color: AppColor.disableTextOrIcon(context)),
              ),
              SizedBox(height: 15.h),
              CustomDropdown<T>(
                decoration: CustomDropdownDecoration(
                  closedSuffixIcon: SvgAsset(
                    asset: IconAssetConstant.arrowDown,
                    size: 20,
                  ),
                  expandedSuffixIcon: SvgAsset(
                    asset: IconAssetConstant.arrowUp,
                    size: 20,
                  ),
                  listItemStyle: AppFont.bodyMedium(context),
                  headerStyle: AppFont.bodyMedium(context),
                  hintStyle: AppFont.bodyMedium(
                    context,
                  )?.copyWith(color: AppColor.disableButton(context)),
                  closedFillColor: AppColor.inputBackground(context),
                  expandedFillColor: AppColor.inputBackground(context),
                  closedBorder: Border.all(
                    color: AppColor.inputBackground(context),
                  ),
                ),
                hintText:
                    selectedValue != null ? displayText(selectedValue) : title,
                controller: SingleSelectController(selectedValue),
                headerBuilder:
                    (context, selectedItem, enabled) => Text(
                      displayText(selectedItem),
                      style: AppFont.bodyMedium(context),
                    ),
                items: options,
                listItemBuilder:
                    (context, item, isSelected, onItemSelect) => Text(
                      displayText(item),
                      style: AppFont.bodyMedium(context),
                    ),
                onChanged: (value) => onChanged(value),
              ),
            ],
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            Lang.of(context).cancel,
            style: AppFont.bodyMedium(
              context,
            )?.copyWith(color: AppColor.error(context)),
          ),
        ),
      ],
    );
  }

  void _onThemeChange(
    BuildContext context,
    WidgetRef ref,
    ThemeModeType? value,
  ) {
    ref
        .read(settingViewModelProvider.notifier)
        .setTheme(value ?? ThemeModeType.main);
    Navigator.pop(context);
  }

  void _onLanguageChange(BuildContext context, WidgetRef ref, String? value) {
    ref
        .read(settingViewModelProvider.notifier)
        .setLanguage(value ?? LocaleIdConstant.ID);
    Navigator.pop(context);
  }
}
