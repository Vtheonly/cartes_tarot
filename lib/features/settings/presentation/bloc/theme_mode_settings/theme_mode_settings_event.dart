import '../../../../../core/freezed/base/base_freezed_n1_m2.dart';
import '../../../../../core/freezed/common/freezed_n2_m1.dart';

typedef XEvent = Freezed<void, void>;
typedef FirstEvent = FirstFreezed<void, void>;
typedef SecondEvent = SecondFreezed<void, void>;

abstract class ThemeModeSettingsEvent<TEvent extends XEvent>
    extends BaseFreezed<TEvent> {
  const ThemeModeSettingsEvent(TEvent event) : super(event);
}

class GetThemeModeEv extends ThemeModeSettingsEvent<FirstEvent> {
  const GetThemeModeEv() : super(const FirstEvent(data: null));
  @override
  void get data => freezed.data;
}

class PostThemeModeEv extends ThemeModeSettingsEvent<SecondEvent> {
  const PostThemeModeEv() : super(const SecondEvent(data: null));
  @override
  void get data => freezed.data;
}
