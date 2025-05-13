import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/failures/common_failure_type.dart';
import '../../../../core/failures/exception.dart';

class StudentModel {
  final String id;
  final String nim;
  final String name;
  final String email;
  final String? password;

  StudentModel({
    required this.id,
    required this.nim,
    required this.name,
    required this.email,
    this.password,
  });

  factory StudentModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    if (data == null) {
      throw CommonException(type: CommonFailureType.documentDataIsNull);
    }

    return StudentModel(
      id: doc.id,
      nim: data['nim'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {'nim': nim, 'name': name, 'email': email};
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'nim': nim, 'name': name, 'email': email};
  }

  factory StudentModel.fromJson(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'] ?? '',
      nim: map['nim'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }
}
