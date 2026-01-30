// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    EntryRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EntryPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          EntryRoute.name,
          path: '/',
        ),
        RouteConfig(
          SettingsRoute.name,
          path: '/settings',
        ),
      ];
}

/// generated route for
/// [EntryPage]
class EntryRoute extends PageRouteInfo<void> {
  const EntryRoute()
      : super(
          EntryRoute.name,
          path: '/',
        );

  static const String name = 'EntryRoute';
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '/settings',
        );

  static const String name = 'SettingsRoute';
}
