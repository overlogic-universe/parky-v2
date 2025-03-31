import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/assets/icon_asset_constant.dart';
import '../../../shared/presentation/widgets/svg_asset.dart';

part 'setting_item_model.freezed.dart';

@freezed
abstract class SettingItemModel with _$SettingItemModel {
  const factory SettingItemModel({
    required String name,
    @Default(SvgAsset(asset: IconAssetConstant.arrowForward, size: 20))
    Widget suffixWidget,
  }) = _SettingItemModel;
}
