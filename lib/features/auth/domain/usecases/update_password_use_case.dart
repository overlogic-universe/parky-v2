import '../repositories/auth_repository.dart';

class UpdatePasswordUseCase {
  final AuthRepository repository;

  UpdatePasswordUseCase({required this.repository});

  Future<void> call({
    required String oldPassword,
    required String newPassword,
  }) async => repository.updatePassword(
    oldPassword: oldPassword,
    newPassword: newPassword,
  );
}
