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

abstract class MultiOptionSelectionState<
        TOptionVM extends OptionVM<dynamic>,
        TOptionsListVM extends OptionsListVM<TOptionVM>,
        TState extends XState<TOptionVM, TOptionsListVM>>
    extends BaseFreezed<TState> {
  const MultiOptionSelectionState(super.state);

  TResult when<TResult extends Object?>(
          {required TResult Function(TOptionsListVM) selected}) =>
      freezed.when(first: selected);

  @override
  TOptionsListVM get data => freezed.data;
}

class SelectedSt<TOptionVM extends OptionVM<dynamic>,
        TOptionsListMV extends OptionsListVM<TOptionVM>>
    extends MultiOptionSelectionState<TOptionVM, TOptionsListMV,
        FirstState<TOptionVM, TOptionsListMV>> {
  SelectedSt({required TOptionsListMV optionsList})
      : super(FirstState(data: optionsList));
}
