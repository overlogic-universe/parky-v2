import '../../../shared/domain/usecases/no_params_use_case.dart';
import '../repositories/setting_repository.dart';

class GetThemeUseCase implements NoParamsUseCase<String> {
  final SettingRepository repository;

  const GetThemeUseCase({required this.repository});

  @override
  Future<String> call() async {
    try {
      return repository.getTheme();
    } catch (e) {
      throw Exception("Failed to get theme: $e");
    }
  }
}
