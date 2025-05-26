import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/failures/common_failure_type.dart';
import '../../../../core/failures/exception.dart';

class StudentModel {
  final String id;
  final String nim;
  final String name;
  final String email;
  final String? password;
  final String qrCodeId;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;

  StudentModel({
    required this.id,
    required this.nim,
    required this.name,
    required this.email,
    this.password,
    required this.qrCodeId,
    this.createdAt,
    this.updatedAt,
  });

  factory StudentModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data();
    if (data == null) {
      throw CommonException(type: CommonFailureType.documentDataIsNull);
    }

    return StudentModel(
      id: doc.id,
      nim: data['nim'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      password: data['password'],
      qrCodeId: data['qr_code_id'] ?? '',
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'nim': nim,
      'name': name,
      'email': email,
      'password': password,
      'qr_code_id': qrCodeId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nim': nim,
      'name': name,
      'email': email,
      'password': password,
      'qr_code_id': qrCodeId,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory StudentModel.fromJson(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'] ?? '',
      nim: map['nim'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'],
      qrCodeId: map['qr_code_id'] ?? '',
      createdAt:
          map['created_at'] != null
              ? Timestamp.fromMillisecondsSinceEpoch(map['created_at'] as int)
              : null,
      updatedAt:
          map['updated_at'] != null
              ? Timestamp.fromMillisecondsSinceEpoch(map['updated_at'] as int)
              : null,
    );
  }

  @override
  String toString() {
    return 'StudentModel(id: $id, nim: $nim, name: $name, email: $email, password: $password, qrCodeId: $qrCodeId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
