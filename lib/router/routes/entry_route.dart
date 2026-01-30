import 'package:auto_route/auto_route.dart';

import '../../core/constants/router_constants.dart';
import '../../entry_page.dart';

const entryRoute = AutoRoute(
  path: Routes.entry,
  page: EntryPage,
  initial: true,
);
