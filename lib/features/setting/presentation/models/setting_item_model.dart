import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_item_model.freezed.dart';

@freezed
abstract class SettingItemModel with _$SettingItemModel {
  const factory SettingItemModel({
    required String name,
    required Widget suffixWidget,
  }) = _SettingItemModel;
}
