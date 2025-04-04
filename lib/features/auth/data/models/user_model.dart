import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/failures/exception_message_constant.dart';
import '../../../../core/failures/exception.dart';

class UserModel {
  final String id;
  final String studentId;
  final String name;
  final String email;
  final String? password;

  UserModel({
    required this.id,
    required this.studentId,
    required this.name,
    required this.email,
    this.password,
  });

  factory UserModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    if (data == null) {
      throw CommonException(
        message: ExceptionMessageConstant.documentDataIsNull,
        type: CommonFailureType.documentDataIsNull,
      );
    }

    return UserModel(
      id: doc.id,
      studentId: data['student_id'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'student_id': studentId,
      'name': name,
      'email': email,
    };
  }
  Map<String, dynamic> toJson() {
    return {
        'id': id,
        'student_id': studentId,
        'name': name,
        'email': email,
      };
  }
  
  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      studentId: map['student_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }
}
