import '../../models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> signOut();
  Future<AuthModel> loginWithGoogle();
  Future<AuthModel> loginWithEmailAndPassword({required AuthModel authModel});
  Future<AuthModel?> getAuthModel();
}
