import '../../../../../core/freezed/base/base_freezed_n1_m2.dart';
import '../../../../../core/freezed/common/freezed_n2_m1.dart';
import '../../helper/vms_entities/theme_mode_vms.dart';

typedef XState = Freezed<ThemeModeVM, ThemeModeVM>;
typedef FirstState = FirstFreezed<ThemeModeVM, ThemeModeVM>;
typedef SecondState = SecondFreezed<ThemeModeVM, ThemeModeVM>;

abstract class ThemeModeSettingsState<TState extends XState>
    extends BaseFreezed<TState> {
  const ThemeModeSettingsState(TState state) : super(state);

  TResult when<TResult extends Object?>(
          {required TResult Function(ThemeModeVM) initial,
          required TResult Function(ThemeModeVM) loaded}) =>
      freezed.when(first: initial, second: loaded);

  @override
  ThemeModeVM get data;
}

class InitialSt extends ThemeModeSettingsState<FirstState> {
  InitialSt({required ThemeModeVM themeMode})
      : super(FirstState(data: themeMode));
  @override
  ThemeModeVM get data => freezed.data;
}

class LoadedSt extends ThemeModeSettingsState<SecondState> {
  LoadedSt({required ThemeModeVM themeMode})
      : super(SecondState(data: themeMode));
  @override
  ThemeModeVM get data => freezed.data;
}
