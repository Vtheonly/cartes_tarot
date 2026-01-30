import '../../freezed/base/base_freezed_n1_m4.dart';
import '../../freezed/common/freezed_n4_m1.dart';
import '../../view_models/option_vms.dart';
import '../../view_models/options_list_vms.dart';

typedef XState<TOptionVM extends OptionVM<dynamic>,
        TOptionsListVM extends OptionsListVM<TOptionVM>>
    = Freezed<void, TOptionsListVM?, TOptionsListVM, TOptionsListVM?>;
typedef FirstState<TOptionVM extends OptionVM<dynamic>,
        TOptionsListVM extends OptionsListVM<TOptionVM>>
    = FirstFreezed<void, TOptionsListVM?, TOptionsListVM, TOptionsListVM?>;
typedef SecondState<TOptionVM extends OptionVM<dynamic>,
        TOptionsListVM extends OptionsListVM<TOptionVM>>
    = SecondFreezed<void, TOptionsListVM?, TOptionsListVM, TOptionsListVM?>;
typedef ThirdState<TOptionVM extends OptionVM<dynamic>,
        TOptionsListVM extends OptionsListVM<TOptionVM>>
    = ThirdFreezed<void, TOptionsListVM?, TOptionsListVM, TOptionsListVM?>;
typedef FourthState<TOptionVM extends OptionVM<dynamic>,
        TOptionsListVM extends OptionsListVM<TOptionVM>>
    = FourthFreezed<void, TOptionsListVM?, TOptionsListVM, TOptionsListVM?>;

abstract class OptionSelectionInputState<
        TOptionVM extends OptionVM<dynamic>,
        TOptionsListVM extends OptionsListVM<TOptionVM>,
        TState extends XState<TOptionVM, TOptionsListVM>>
    extends BaseFreezed<TState> {
  const OptionSelectionInputState(super.state);

  TResult when<TResult extends Object?>(
          {required TResult Function(void) initial,
          required TResult Function(TOptionsListVM?) loading,
          required TResult Function(TOptionsListVM) loaded,
          required TResult Function(TOptionsListVM?) error}) =>
      freezed.when(
          first: initial, second: loading, third: loaded, fourth: error);

  TResult maybeWhen<TResult extends Object?>(
          {TResult Function(void)? initial,
          TResult Function(TOptionsListVM?)? loading,
          TResult Function(TOptionsListVM)? loaded,
          TResult Function(TOptionsListVM?)? error,
          required TResult Function() orElse}) =>
      freezed.maybeWhen(
          first: initial,
          second: loading,
          third: loaded,
          fourth: error,
          orElse: orElse);

  void maybeWhenOrNull<TResult extends Object?>(
          {TResult Function(void)? initial,
          TResult Function(TOptionsListVM?)? loading,
          TResult Function(TOptionsListVM)? loaded,
          TResult Function(TOptionsListVM?)? error}) =>
      freezed.maybeWhen(
          first: initial,
          second: loading,
          third: loaded,
          fourth: error,
          orElse: () => null);

  @override
  void get data => freezed.data;
}

class InitialSt<TOptionVM extends OptionVM<dynamic>,
        TOptionsListVM extends OptionsListVM<TOptionVM>>
    extends OptionSelectionInputState<TOptionVM, TOptionsListVM,
        FirstState<TOptionVM, TOptionsListVM>> {
  const InitialSt() : super(const FirstState(data: null));
}

class LoadingSt<TOptionVM extends OptionVM<dynamic>,
        TOptionsListVM extends OptionsListVM<TOptionVM>>
    extends OptionSelectionInputState<TOptionVM, TOptionsListVM,
        SecondState<TOptionVM, TOptionsListVM>> {
  LoadingSt({required TOptionsListVM? optionsList})
      : super(SecondState(data: optionsList));

  @override
  TOptionsListVM? get data => freezed.data;
}

class LoadedSt<TOptionVM extends OptionVM<dynamic>,
        TOptionsListVM extends OptionsListVM<TOptionVM>>
    extends OptionSelectionInputState<TOptionVM, TOptionsListVM,
        ThirdState<TOptionVM, TOptionsListVM>> {
  LoadedSt({required TOptionsListVM optionsList})
      : super(ThirdState(data: optionsList));

  @override
  TOptionsListVM get data => freezed.data;
}

class ErrorSt<TOptionVM extends OptionVM<dynamic>,
        TOptionsListVM extends OptionsListVM<TOptionVM>>
    extends OptionSelectionInputState<TOptionVM, TOptionsListVM,
        FourthState<TOptionVM, TOptionsListVM>> {
  ErrorSt({required TOptionsListVM? optionsList})
      : super(FourthState(data: optionsList));

  @override
  TOptionsListVM? get data => freezed.data;
}
