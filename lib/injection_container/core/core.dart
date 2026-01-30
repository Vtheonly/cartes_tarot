import '../../core/bloc/background_process_bloc/background_process_bloc.dart';
import '../../core/others/bloc/tab_controller_bloc_i0_l2.dart';
import '../../router/router.dart';
import '../../core/services/global_navigator.dart';
import '../../core/services/os_chrome.dart';
import '../../core/services/secure_local_data.dart';
import '../../core/utils/date_time_utils.dart';
import '../../core/utils/form_field_validator_utils.dart';
import '../../core/utils/theme_mode_utils.dart';
import '../service_locator.dart';

void init() {
  // Services
  sl.registerLazySingleton<OSChrome>(() => const OSChromeImpl());
  sl.registerLazySingleton<GlobalNavigator>(
      () => GlobalNavigatorImpl(router: sl<AppRouter>(), osChrome: sl()));
  sl.registerLazySingleton<SecureLocalData>(
      () => SecureLocalDataImpl(secureStorage: sl()));

  // Utils
  sl.registerLazySingleton<ThemeModeUtils>(() => const ThemeModeUtilsImpl());
  sl.registerLazySingleton<FormFielsValidatorUtils>(
      () => const FormFielsValidatorUtilsImpl());
  sl.registerLazySingleton<DateTimeUtils>(() => const DateTimeUtilsImpl());

  //Blocs
  sl.registerFactory(() => EntryPageTabControllerBloc());
  sl.registerFactory(() => BackgroundProcessBloc());
}
