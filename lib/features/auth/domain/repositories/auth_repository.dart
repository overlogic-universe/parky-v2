import '../../../../core/utils/resource_state.dart';
import '../entities/student_entity.dart';
import '../entities/login_with_email_password_request.dart';

abstract class AuthRepository {
  Future<StudentEntity> loginWithEmailAndPassword({
    required LoginWithEmailPasswordRequest loginWithEmailPasswordRequest,
  });
  Future<void> signOut();
  Future<StudentEntity> loginWithGoogle();
  Future<ResourceState<StudentEntity>> getStudentEntity();
  Future<String?> isLogin();
}
