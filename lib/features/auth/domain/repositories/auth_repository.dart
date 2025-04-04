import '../../../../core/utils/resource_state.dart';
import '../entities/user_entity.dart';
import '../entities/login_with_email_password_request.dart';

abstract class AuthRepository {
  Future<UserEntity> loginWithEmailAndPassword({
    required LoginWithEmailPasswordRequest loginWithEmailPasswordRequest,
  });
  Future<void> signOut();
  Future<UserEntity> loginWithGoogle();
  Future<ResourceState<UserEntity>> getUserEntity();
}
