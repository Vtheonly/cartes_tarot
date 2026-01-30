import 'package:dartz/dartz.dart';

import '../../../../core/error/failures/failures.dart';
import '../../core/error/failures.dart';
import '../entities/theme_mode.dart';

abstract class ThemeModeSettingsRepository {
  Future<Either<CacheFailure, void>> postThemeMode(ThemeMode themeMode);
  Future<Either<CacheFailureTV1, ThemeMode>> getThemeMode();
}
