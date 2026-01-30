import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/services/os_chrome.dart';
import '../../../../../core/utils/theme_mode_utils.dart';
import '../../../core/error/failures.dart';
import '../../../domain/entities/theme_mode.dart';
import '../../../domain/usecases/theme_mode_settings_usecases.dart/get_theme_mode.dart';
import '../../../domain/usecases/theme_mode_settings_usecases.dart/post_theme_mode.dart';
import '../../helper/vms_entities/theme_mode_vms.dart';
import 'theme_mode_settings_event.dart';
import 'theme_mode_settings_state.dart';

class ThemeModeSettingsBloc
    extends Bloc<ThemeModeSettingsEvent, ThemeModeSettingsState> {
  final GetThemeMode getThemeMode;
  final PostThemeMode postThemeMode;
  final ThemeModeUtils themeModeUtils;
  final OSChrome oSChrome;

  ThemeModeSettingsBloc({
    required this.getThemeMode,
    required this.postThemeMode,
    required this.themeModeUtils,
    required this.oSChrome,
    required Either<CacheFailureTV1, ThemeMode> initialData,
  }) : super(InitialSt(
          themeMode: initialData.fold(
              (failure) => ThemeModeVM(themeMode: failure.data),
              (themeMode) => ThemeModeVM(themeMode: themeMode)),
        )) {
    _setInitialNavigationBarColor();

    on<GetThemeModeEv>((event, emit) async {
      final eitherFailureOrThemeMode = await getThemeMode();
      eitherFailureOrThemeMode.fold(
          (failure) => null,
          (themeMode) => emit(
                LoadedSt(themeMode: ThemeModeVM(themeMode: themeMode)),
              ));
    });

    on<PostThemeModeEv>((event, emit) {
      final currentThemeMode = state.data;
      final inversedMode = themeModeUtils
          .themeModeFromBooleanDarkMode(!(currentThemeMode.vm1.isDarkMode));
      final inversedThemeMode = ThemeMode.from(inversedMode);
      emit(LoadedSt(themeMode: ThemeModeVM(themeMode: inversedThemeMode)));
      // No need for await.
      postThemeMode(inversedThemeMode);
    });
  }

  void addPostThemeModeEv() => add(const PostThemeModeEv());
  void addGetThemeModeEv() => add(const GetThemeModeEv());

  void _setInitialNavigationBarColor() =>
      oSChrome.setNavigationBarColor(state.data.vm1.isDarkMode);
}
