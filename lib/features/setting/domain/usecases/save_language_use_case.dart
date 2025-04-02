import '../../../shared/domain/usecases/use_case.dart';
import '../repositories/setting_repository.dart';

class SaveLanguageUseCase implements UseCase<void, String> {
  final SettingRepository repository;

  const SaveLanguageUseCase({required this.repository});

  @override
  Future<void> call(String language) async {
    try {
      return repository.saveLanguage(language);
    } catch (e) {
      throw Exception("Failed to save language: $e");
    }
  }
}
