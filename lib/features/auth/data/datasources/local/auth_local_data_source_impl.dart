import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../../../core/failures/auth_exception.dart';
import '../../../core/failures/auth_failure_type.dart';
import '../../models/student_model.dart';
import 'auth_local_data_source.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  final Database sqfliteDatabase;

  AuthLocalDataSourceImpl({
    required this.sharedPreferences,
    required this.sqfliteDatabase,
  });

  static const String _authToken = "auth_token";
  static const String _studentTable = "students";

  @override
  Future<void> saveAuthToken(String token) async {
    await sharedPreferences.setString(_authToken, token);
  }

  @override
  Future<String?> getAuthToken() async {
    final token = sharedPreferences.getString(_authToken);
    return token;
  }

  @override
  Future<void> clearAuthToken() async {
    await sharedPreferences.remove(_authToken);
  }

  @override
  Future<void> saveStudentModel(StudentModel? student) async {
    if (student == null) {
      throw AuthException(type: AuthFailureType.studentNotFound);
    }
    await sqfliteDatabase.insert(
      _studentTable,
      student.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<StudentModel> getStudentModel() async {
    final List<Map<String, dynamic>> result = await sqfliteDatabase.query(
      _studentTable,
      limit: 1,
    );

    if (result.isEmpty) {
      throw AuthException(type: AuthFailureType.studentNotFound);
    }

    final data = result.first;

    return StudentModel.fromJson(data);
  }
}
