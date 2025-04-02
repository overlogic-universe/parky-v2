import '../entities/auth_entity.dart';

abstract class AuthRepository {
  Future<AuthEntity> loginWithEmailAndPassword({required AuthEntity authEntity});
  Future<void> signOut();
  Future<AuthEntity> loginWithGoogle();
}
