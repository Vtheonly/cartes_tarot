import 'core/core.dart' as core;
import 'router/router.dart' as router;
import 'external/external.dart' as externall;
import 'features/settings_feature.dart' as settings_feature;

Future<void> init() async {
  //! Router
  router.init();

  //! External
  await externall.init();
  //! Core
  core.init();

  //! Features
  settings_feature.init();
}
