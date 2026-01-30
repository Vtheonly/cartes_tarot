import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures/failures.dart';
import '../../../../../core/usecases/base/usecases.dart';
import '../../entities/theme_mode.dart';
import '../../repositories/theme_mode_settings_repository.dart';

class PostThemeMode
    implements FutureEitherUseCase<CacheFailure, void, ThemeMode> {
  final ThemeModeSettingsRepository repository;

  PostThemeMode({required this.repository});

  @override
  Future<Either<CacheFailure, void>> call(themeMode) async {
    return await repository.postThemeMode(themeMode);
  }
}
