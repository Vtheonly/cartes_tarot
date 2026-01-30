import '../../freezed/base/base_freezed_n1_m2.dart';
import '../../freezed/common/freezed_n2_m1.dart';
import '../../view_models/page_index_vms.dart';

typedef XEvent = Freezed<PageIndexVM, void>;
typedef FirstEvent = FirstFreezed<PageIndexVM, void>;
typedef SecondEvent = SecondFreezed<PageIndexVM, void>;

abstract class TabControllerEvent<TEvent extends XEvent>
    extends BaseFreezed<TEvent> {
  const TabControllerEvent(super.event);
}

class SwitchToEv extends TabControllerEvent<FirstEvent> {
  SwitchToEv({required PageIndexVM pageIndex})
      : super(FirstEvent(data: pageIndex));
  @override
  PageIndexVM get data => freezed.data;
}

class EmitInitialEv extends TabControllerEvent<SecondEvent> {
  const EmitInitialEv() : super(const SecondEvent(data: null));
  @override
  void get data => freezed.data;
}
