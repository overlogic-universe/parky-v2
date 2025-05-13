import 'package:freezed_annotation/freezed_annotation.dart';

part 'tab_model.freezed.dart';

@freezed
abstract class TabModel with _$TabModel {
  const factory TabModel({
    required String icon,
  }) = _TabModel;
}
