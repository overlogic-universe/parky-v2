import '../../../domain/entities/login_with_email_password_request.dart';
import '../../models/student_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> signOut();
  Future<StudentModel> loginWithGoogle();
  Future<StudentModel> loginWithEmailAndPassword({
   required LoginWithEmailPasswordRequest loginWithEmailPasswordRequest,
  });
  Future<StudentModel?> getStudentModel();
  Future<void> updatePassword({required String oldPassword, required String newPassword});
}
