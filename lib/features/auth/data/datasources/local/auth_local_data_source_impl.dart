import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'auth_local_data_source.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  final Database sqfliteDatabase;

  AuthLocalDataSourceImpl({
    required this.sharedPreferences,
    required this.sqfliteDatabase,
  });

  static const String _authToken = "auth_token";

  @override
  Future<void> saveAuthToken(String token) async {
    await sharedPreferences.setString(_authToken, token);
  }

  @override
  Future<String?> getAuthToken() async {
    return sharedPreferences.getString(_authToken);
  }

  @override
  Future<void> clearAuthToken() async {
    await sharedPreferences.remove(_authToken);
  }
}
