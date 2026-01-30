import '../../freezed/base/base_freezed_n1_m4.dart';
import '../../freezed/common/freezed_n4_m1.dart';
import '../../view_models/option_vms.dart';

typedef XEvent<TOptionVM extends OptionVM<dynamic>>
    = Freezed<TOptionVM, void, void, void>;
typedef FirstEvent<TOptionVM extends OptionVM<dynamic>>
    = FirstFreezed<TOptionVM, void, void, void>;
typedef SecondEvent<TOptionVM extends OptionVM<dynamic>>
    = SecondFreezed<TOptionVM, void, void, void>;
typedef ThirdEvent<TOptionVM extends OptionVM<dynamic>>
    = ThirdFreezed<TOptionVM, void, void, void>;
typedef FourthEvent<TOptionVM extends OptionVM<dynamic>>
    = FourthFreezed<TOptionVM, void, void, void>;

abstract class MultiOptionSelectionEvent<TOptionVM extends OptionVM<dynamic>,
    TEvent extends XEvent<TOptionVM>> extends BaseFreezed<TEvent> {
  const MultiOptionSelectionEvent(super.event);

  @override
  void get data => freezed.data;
}

class InverseSelectionEv<TOptionVM extends OptionVM<dynamic>>
    extends MultiOptionSelectionEvent<TOptionVM, FirstEvent<TOptionVM>> {
  InverseSelectionEv({required TOptionVM option})
      : super(FirstEvent(data: option));
  @override
  TOptionVM get data => freezed.data;
}

class ClearAllEv<TOptionVM extends OptionVM<dynamic>>
    extends MultiOptionSelectionEvent<TOptionVM, SecondEvent<TOptionVM>> {
  const ClearAllEv() : super(const SecondEvent(data: null));
}

class SelectAllEv<TOptionVM extends OptionVM<dynamic>>
    extends MultiOptionSelectionEvent<TOptionVM, ThirdEvent<TOptionVM>> {
  const SelectAllEv() : super(const ThirdEvent(data: null));
}

class ConfirmEv<TOptionVM extends OptionVM<dynamic>>
    extends MultiOptionSelectionEvent<TOptionVM, FourthEvent<TOptionVM>> {
  const ConfirmEv() : super(const FourthEvent(data: null));
}
