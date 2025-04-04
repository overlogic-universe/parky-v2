import '../../../shared/domain/usecases/use_case.dart';
import '../repositories/setting_repository.dart';

class SaveThemeUseCase implements UseCase<void, String> {
  final SettingRepository repository;

  const SaveThemeUseCase({required this.repository});

  @override
  Future<void> call({required String params}) async {
    try {
      return repository.saveTheme(params);
    } catch (e) {
      throw Exception("Failed to save theme: $e");
    }
  }
}
