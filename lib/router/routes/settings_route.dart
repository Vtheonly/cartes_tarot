import 'package:auto_route/auto_route.dart';

import '../../core/constants/router_constants.dart';
import '../../features/settings/presentation/pages/settings_page.dart';

const settingsRoute = AutoRoute(
  path: Routes.settings,
  page: SettingsPage,
);
