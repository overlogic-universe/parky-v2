import '../../../shared/domain/usecases/use_case.dart';
import '../repositories/setting_repository.dart';

class SaveLanguageUseCase implements UseCase<void, String> {
  final SettingRepository repository;

  const SaveLanguageUseCase({required this.repository});

  @override
  Future<void> call({required String params}) async {
    try {
      return repository.saveLanguage(params);
    } catch (e) {
      throw Exception("Failed to save language: $e");
    }
  }
}
