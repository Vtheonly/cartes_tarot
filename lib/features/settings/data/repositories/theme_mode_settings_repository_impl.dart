import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions/cache_exception.dart';
import '../../../../core/error/failures/failures.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/theme_mode.dart';
import '../../domain/repositories/theme_mode_settings_repository.dart';
import '../datasources/theme_mode_settings_datasources/theme_mode_settings_local_datasource.dart';
import '../models/theme_mode_model.dart';

class ThemeModeSettingsRepositoryImpl implements ThemeModeSettingsRepository {
  final ThemeModeSettingsLocalDataSource localDataSource;

  ThemeModeSettingsRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<CacheFailure, void>> postThemeMode(ThemeMode themeMode) async {
    try {
      await localDataSource
          .cacheThemeMode(ThemeModeModel.fromEntity(themeMode));
      return const Right(null);
    } on CacheException {
      return const Left(CacheFailure());
    }
  }

  @override
  Future<Either<CacheFailureTV1, ThemeMode>> getThemeMode() async {
    try {
      final themeMode = await localDataSource.getThemeMode();
      return Right(themeMode);
    } on CacheException {
      return const Left(CacheFailureTV1(data: ThemeMode.defaullt()));
    }
  }
}
