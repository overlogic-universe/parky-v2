import '../../../domain/entities/login_with_email_password_request.dart';
import '../../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> signOut();
  Future<UserModel> loginWithGoogle();
  Future<UserModel> loginWithEmailAndPassword({
   required LoginWithEmailPasswordRequest loginWithEmailPasswordRequest,
  });
  Future<UserModel?> getUserModel();
}
