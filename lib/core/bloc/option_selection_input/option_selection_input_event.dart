import '../../freezed/base/base_freezed_n1_m3.dart';
import '../../freezed/common/freezed_n3_m1.dart';
import '../../view_models/option_vms.dart';

typedef XEvent<TOptionVM extends OptionVM<dynamic>>
    = Freezed<void, void, TOptionVM>;
typedef FirstEvent<TOptionVM extends OptionVM<dynamic>>
    = FirstFreezed<void, void, TOptionVM>;
typedef SecondEvent<TOptionVM extends OptionVM<dynamic>>
    = SecondFreezed<void, void, TOptionVM>;
typedef ThirdEvent<TOptionVM extends OptionVM<dynamic>>
    = ThirdFreezed<void, void, TOptionVM>;

abstract class OptionSelectionInputEvent<TOptionVM extends OptionVM<dynamic>,
    TEvent extends XEvent<TOptionVM>> extends BaseFreezed<TEvent> {
  const OptionSelectionInputEvent(super.event);

  @override
  void get data => freezed.data;
}

class ChooseAllEv<TOptionVM extends OptionVM<dynamic>>
    extends OptionSelectionInputEvent<TOptionVM, FirstEvent<TOptionVM>> {
  const ChooseAllEv() : super(const FirstEvent(data: null));
}

class LoadToChooseEv<TOptionVM extends OptionVM<dynamic>>
    extends OptionSelectionInputEvent<TOptionVM, SecondEvent<TOptionVM>> {
  const LoadToChooseEv() : super(const SecondEvent(data: null));
}

class LoadWithEv<TOptionVM extends OptionVM<dynamic>>
    extends OptionSelectionInputEvent<TOptionVM, ThirdEvent<TOptionVM>> {
  LoadWithEv({required TOptionVM option}) : super(ThirdEvent(data: option));

  @override
  TOptionVM get data => freezed.data;
}
