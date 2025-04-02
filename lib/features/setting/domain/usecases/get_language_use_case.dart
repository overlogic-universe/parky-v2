import '../../../shared/domain/usecases/no_params_use_case.dart';
import '../repositories/setting_repository.dart';

class GetLanguageUseCase implements NoParamsUseCase<String> {
  final SettingRepository repository;

  const GetLanguageUseCase({required this.repository});

  @override
  Future<String> call() async {
    try {
      return repository.getLanguage();
    } catch (e) {
      throw Exception("Failed to get language: $e");
    }
  }
}
