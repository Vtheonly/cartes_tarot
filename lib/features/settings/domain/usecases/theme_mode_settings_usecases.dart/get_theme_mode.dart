import 'package:dartz/dartz.dart';

import '../../../../../core/usecases/base/usecases.dart';
import '../../../core/error/failures.dart';
import '../../entities/theme_mode.dart';
import '../../repositories/theme_mode_settings_repository.dart';

class GetThemeMode
    implements NoParamsFutureEitherUseCase<CacheFailureTV1, ThemeMode> {
  final ThemeModeSettingsRepository repository;

  GetThemeMode({required this.repository});

  @override
  Future<Either<CacheFailureTV1, ThemeMode>> call() async {
    return await repository.getThemeMode();
  }
}
