import '../../freezed/base/base_freezed_n1_m1.dart';
import '../../freezed/common/freezed_n1_m1.dart';
import 'background_process_state.dart';

typedef XEvent = Freezed<BackgroundProcessState>;
typedef FirstEvent = FirstFreezed<BackgroundProcessState>;

abstract class BackgroundProcessEvent<TEvent extends XEvent>
    extends BaseFreezed<TEvent> {
  const BackgroundProcessEvent(super.event);
}

class EmitStateEv extends BackgroundProcessEvent<FirstEvent> {
  EmitStateEv({required BackgroundProcessState state})
      : super(FirstEvent(data: state));

  @override
  BackgroundProcessState get data => freezed.data;
}
