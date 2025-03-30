import 'package:freezed_annotation/freezed_annotation.dart';

part 'drawer_item_model.freezed.dart';

@freezed
abstract class DrawerItemModel with _$DrawerItemModel {
  const factory DrawerItemModel({
    required String name,
    required String icon,
    @Default(false) bool isLogout,
  }) = _DrawerItemModel;
}
