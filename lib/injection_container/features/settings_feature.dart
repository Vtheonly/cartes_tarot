import '../../features/settings/data/datasources/theme_mode_settings_datasources/theme_mode_settings_local_datasource.dart';
import '../../features/settings/data/repositories/theme_mode_settings_repository_impl.dart';
import '../../features/settings/domain/repositories/theme_mode_settings_repository.dart';
import '../../features/settings/domain/usecases/theme_mode_settings_usecases.dart/get_theme_mode.dart';
import '../../features/settings/domain/usecases/theme_mode_settings_usecases.dart/post_theme_mode.dart';
import '../../features/settings/presentation/bloc/theme_mode_settings/theme_mode_settings_bloc.dart';
import '../service_locator.dart';

void init() {
  // Bloc
  sl.registerFactoryAsync(() async {
    final eitherFailureOrThemeMode = await sl<GetThemeMode>().call();
    return ThemeModeSettingsBloc(
      getThemeMode: sl(),
      postThemeMode: sl(),
      themeModeUtils: sl(),
      oSChrome: sl(),
      initialData: eitherFailureOrThemeMode,
    );
  });

  // Usecases
  sl.registerLazySingleton(() => GetThemeMode(repository: sl()));

  sl.registerLazySingleton(() => PostThemeMode(repository: sl()));

  // Repositories
  sl.registerLazySingleton<ThemeModeSettingsRepository>(
      () => ThemeModeSettingsRepositoryImpl(localDataSource: sl()));

  // Datasources
  sl.registerLazySingleton<ThemeModeSettingsLocalDataSource>(
      () => ThemeModeSettingsLocalDataSourceImpl(sharedPreferences: sl()));
}
