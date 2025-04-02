import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/failures/exception_message_constant.dart';
import '../../../../core/failures/exception.dart';

part 'auth_model.freezed.dart';

@freezed
abstract class AuthModel with _$AuthModel {
  const factory AuthModel({
    required String id,
    required String username,
    required String email,
    @Default(null) String? password,
  }) = _AuthModel;
}

extension AuthModelFirestore on AuthModel {
  static AuthModel fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    if (data == null) {
      throw CommonException(
        message: ExceptionMessageConstant.documentDataIsNull,
        type: CommonFailureType.documentDataIsNull,
      );
    }

    return AuthModel(
      id: doc.id,
      username: data['username'] ?? '',
      email: data['email'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {'username': username, 'email': email};
  }
}
