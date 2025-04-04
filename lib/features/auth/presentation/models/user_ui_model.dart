import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_ui_model.freezed.dart';

@freezed
abstract class UserUiModel with _$UserUiModel {
  const factory UserUiModel({
    required String id,
    required String studentId,
    required String name,
    required String email,
  }) = _UserUiModel;
}