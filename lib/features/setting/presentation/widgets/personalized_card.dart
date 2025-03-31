import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/common/locale_id_constant.dart';
import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/colors/theme_color.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../../../core/utils/lang.dart';
import '../../../shared/presentation/widgets/custom_toast.dart';
import '../models/setting_item_model.dart';
import '../view_models/setting_view_model.dart';
import 'base_setting_card.dart';

class PersonalizedCard extends ConsumerWidget {
  const PersonalizedCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(settingViewModelProvider, (previous, next) {
      next.maybeWhen(
        data: (data) {
          if (previous != null) {
            final prevData = previous.valueOrNull;
            if (prevData != null) {
              if (prevData.themeModeType != data.themeModeType) {
                CustomToast.showToast(
                  context,
                  message: Lang.of(context).successChangeTheme,
                  backgroundColor: AppColor.success(context),
                );
              } else if (prevData.localeId != data.localeId) {
                CustomToast.showToast(
                  context,
                  message: Lang.of(context).successChangeLanguage,
                  backgroundColor: AppColor.success(context),
                );
              }
            }
          }
        },
        orElse: () {},
      );
    });

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
              DropdownButton<T>(
                isExpanded: true,
                value: selectedValue,
                hint: Text(
                  selectedValue != null ? displayText(selectedValue) : title,
                  style: AppFont.bodyMedium(
                    context,
                  )?.copyWith(color: AppColor.disableButton(context)),
                ),
                items:
                    options.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          displayText(value),
                          style: AppFont.bodyMedium(context),
                        ),
                      );
                    }).toList(),
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
