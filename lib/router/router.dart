import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../entry_page.dart';
import '../features/settings/presentation/pages/settings_page.dart';
import 'routes/entry_route.dart';
import 'routes/settings_route.dart';

part 'router.gr.dart';

//TODO : Don't forget the router

@MaterialAutoRouter(replaceInRouteName: "Page,Route", routes: <AutoRoute>[
  entryRoute,
  settingsRoute,
])
class AppRouter extends _$AppRouter {}
