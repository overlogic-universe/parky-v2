import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parky/features/shared/presentation/widgets/custom_toast.dart';

import '../../../../core/styles/colors/app_color.dart';
import '../../../../core/styles/colors/theme_color.dart';
import '../../../../core/styles/fonts/app_font.dart';
import '../../../../core/utils/lang.dart';
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
      showDialog(
        context: context,
        builder:
            (context) => _buildPopUp(
              context,
              ref,
              title: Lang.of(context).chooseTheme,
              description: Lang.of(context).chooseThemeDesc,
            ),
      );
    } else if (name == Lang.of(context).chooseLanguage) {
      showDialog(
        context: context,
        builder:
            (context) => _buildPopUp(
              context,
              ref,
              title: Lang.of(context).chooseLanguage,
              description: Lang.of(context).chooseLanguageDesc,
            ),
      );
    }
  }

  Widget _buildPopUp(
    BuildContext context,
    WidgetRef ref, {
    required String title,
    required String description,
  }) {
    final state = ref.watch(settingViewModelProvider);

    ThemeModeType? selectedValue = state.maybeWhen(
      data: (data) => data.themeModeType,
      orElse: () => null,
    );

    List<ThemeModeType> dropDownList = [ThemeModeType.main, ThemeModeType.orb];
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      content: StatefulBuilder(
        builder: (context, _) {
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
              DropdownButton<ThemeModeType>(
                isExpanded: true,
                value: selectedValue,
                hint: Text(
                  selectedValue?.displayName(context) ?? title,
                  style: AppFont.bodyMedium(
                    context,
                  )?.copyWith(color: AppColor.disableButton(context)),
                ),

                items:
                    dropDownList.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value.displayName(context),
                          style: AppFont.bodyMedium(context),
                        ),
                      );
                    }).toList(),
                onChanged: (value) => _onThemeChange(context, ref, value),
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
    final state = ref.watch(settingViewModelProvider);
    state.maybeWhen(
      data:
          (_) => CustomToast.showToast(
            message: Lang.of(context).successChangeTheme,
            backgroundColor: AppColor.success(context),
          ),
      loading: () {},
      orElse:
          () => CustomToast.showToast(
            message: Lang.of(context).successChangeLanguage,
          ),
    );
    Navigator.pop(context);
  }
}
