import '../../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> saveAuthToken(String token);
  Future<String?> getAuthToken();
  Future<void> clearAuthToken();
  Future<UserModel> getUserModel();
  Future<void> saveUserModel(UserModel? userModel);
}
