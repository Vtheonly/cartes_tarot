import '../../freezed/base/base_freezed_n1_m1.dart';
import '../../freezed/common/freezed_n1_m1.dart';
import '../../view_models/option_vms.dart';
import '../../view_models/options_list_vms.dart';

typedef XState<TOptionVM extends OptionVM<dynamic>,
        TOptionsListVM extends OptionsListVM<TOptionVM>>
    = Freezed<TOptionsListVM>;
typedef FirstState<TOptionVM extends OptionVM<dynamic>,
        TOptionsListVM extends OptionsListVM<TOptionVM>>
    = FirstFreezed<TOptionsListVM>;

abstract class SingleOptionSelectionState<
        TOptionVM extends OptionVM<dynamic>,
        TOptionsListVM extends OptionsListVM<TOptionVM>,
        TState extends XState<TOptionVM, TOptionsListVM>>
    extends BaseFreezed<TState> {
  const SingleOptionSelectionState(super.state);

  @override
  TOptionsListVM get data => freezed.data;
}

class SelectedSt<TOptionVM extends OptionVM<dynamic>,
        TOptionsListVM extends OptionsListVM<TOptionVM>>
    extends SingleOptionSelectionState<TOptionVM, TOptionsListVM,
        FirstState<TOptionVM, TOptionsListVM>> {
  SelectedSt({required TOptionsListVM optionsList})
      : super(FirstState(data: optionsList));
}
