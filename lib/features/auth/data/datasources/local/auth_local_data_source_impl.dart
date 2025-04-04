import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../../../core/constants/failures/auth_exception_message_constant.dart';
import '../../../core/failures/auth_exception.dart';
import '../../models/user_model.dart';
import 'auth_local_data_source.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  final Database sqfliteDatabase;

  AuthLocalDataSourceImpl({
    required this.sharedPreferences,
    required this.sqfliteDatabase,
  });

  static const String _authToken = "auth_token";
  static const String _userTable = "users";

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
  Future<void> saveUserModel(UserModel? userModel) async {
    if (userModel == null) {
      throw AuthException(
        message: AuthExceptionMessageConstant.userNotFound,
        type: AuthFailureType.userNotFound,
      );
    }
    await sqfliteDatabase.insert(
      _userTable,
      userModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<UserModel> getUserModel() async {
    final List<Map<String, dynamic>> result = await sqfliteDatabase.query(
      _userTable,
      limit: 1,
    );

    if (result.isEmpty) {
      throw AuthException(
        message: AuthExceptionMessageConstant.userNotFound,
        type: AuthFailureType.userNotFound,
      );
    }

    final data = result.first;

    return UserModel.fromJson(data);
  }
}
