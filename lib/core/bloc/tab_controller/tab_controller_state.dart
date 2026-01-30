import '../../freezed/base/base_freezed_n1_m1.dart';
import '../../freezed/common/freezed_n1_m1.dart';
import '../../view_models/tab_controller_vms.dart';

typedef XState = Freezed<TabControllerVM>;
typedef FirstState = FirstFreezed<TabControllerVM>;

abstract class TabControllerState<TState extends XState>
    extends BaseFreezed<TState> {
  const TabControllerState(super.state);

  TResult when<TResult extends Object?>(
          {required TResult Function(TabControllerVM) initial}) =>
      freezed.when(first: initial);

  @override
  TabControllerVM get data;
}

class InitialSt extends TabControllerState<FirstState> {
  InitialSt({required TabControllerVM tabController})
      : super(FirstState(data: tabController));
  @override
  TabControllerVM get data => freezed.data;
}
