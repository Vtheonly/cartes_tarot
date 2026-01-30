import '../../freezed/base/base_freezed_n1_m4.dart';
import '../../freezed/common/freezed_n4_m1.dart';

typedef XState = Freezed<void, void, void, void>;
typedef FirstState = FirstFreezed<void, void, void, void>;
typedef SecondState = SecondFreezed<void, void, void, void>;
typedef ThirdState = ThirdFreezed<void, void, void, void>;
typedef FourthState = FourthFreezed<void, void, void, void>;

abstract class BackgroundProcessState<TState extends XState>
    extends BaseFreezed<TState> {
  const BackgroundProcessState(super.state);

  TResult when<TResult extends Object?>(
          {required TResult Function(void) initial,
          required TResult Function(void) loading,
          required TResult Function(void) loaded,
          required TResult Function(void) error}) =>
      freezed.when(
          first: initial, second: loading, third: loaded, fourth: error);

  TResult maybeWhen<TResult extends Object?>(
          {TResult Function(void)? initial,
          TResult Function(void)? loading,
          TResult Function(void)? loaded,
          TResult Function(void)? error,
          required TResult Function() orElse}) =>
      freezed.maybeWhen(
          first: initial,
          second: loading,
          third: loaded,
          fourth: error,
          orElse: orElse);

  @override
  void get data => freezed.data;
}

class InitialSt extends BackgroundProcessState<FirstState> {
  const InitialSt() : super(const FirstState(data: null));
}

class LoadingSt extends BackgroundProcessState<SecondState> {
  const LoadingSt() : super(const SecondState(data: null));
}

class LoadedSt extends BackgroundProcessState<ThirdState> {
  const LoadedSt() : super(const ThirdState(data: null));
}

class ErrorSt extends BackgroundProcessState<FourthState> {
  const ErrorSt() : super(const FourthState(data: null));
}
