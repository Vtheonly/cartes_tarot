import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../router/router.dart';
import '../styles/colors.dart';
import 'os_chrome.dart';

abstract class GlobalNavigator {
  Future<T?> showGlobalDialog<T>(Widget widget);
  Future<bool> pop<T extends Object?>([T? result]);
  Future<T?> pushNamed<T>(String path);
  Future<T?> showGlobalBarModalBottomSheet<T>(Widget widget);
  Future<T?> showGlobalMaterialModalBottomSheet<T>(Widget widget);
  Future<void> showLoadingBottomSheet();
  Future<void> showErrorBottomSheet();
}

class GlobalNavigatorImpl implements GlobalNavigator {
  final AppRouter router;
  final OSChrome osChrome;

  GlobalNavigatorImpl({required this.router, required this.osChrome});
  @override
  Future<T?> showGlobalDialog<T>(Widget widget) => showDialog<T>(
        context: router.navigatorKey.currentContext!,
        barrierDismissible: false,
        barrierColor: Black.s40,
        builder: (_) => widget,
      );

  @override
  Future<bool> pop<T extends Object?>([T? result]) => router.pop<T>(result);

  @override
  Future<T?> pushNamed<T>(String path) => router.pushNamed<T>(path);

  @override
  Future<T?> showGlobalBarModalBottomSheet<T>(Widget widget) =>
      showBarModalBottomSheet<T>(
          context: router.navigatorKey.currentContext!,
          backgroundColor:
              Theme.of(router.navigatorKey.currentContext!).colorScheme.surface,
          barrierColor: Black.s40,
          builder: (_) => widget,
          overlayStyle: osChrome
              .createSystemUiOverlayStyle(router.navigatorKey.currentContext!));

  @override
  Future<T?> showGlobalMaterialModalBottomSheet<T>(Widget widget) =>
      showMaterialModalBottomSheet<T>(
        context: router.navigatorKey.currentContext!,
        backgroundColor:
            Theme.of(router.navigatorKey.currentContext!).colorScheme.surface,
        barrierColor: Black.s40,
        builder: (_) => widget,
      );

  @override
  Future<void> showErrorBottomSheet() =>
      showGlobalBarModalBottomSheet(const SizedBox(
        height: 100,
        child: Center(child: Text("Error")),
      ));

  @override
  Future<void> showLoadingBottomSheet() =>
      showGlobalBarModalBottomSheet(const SizedBox(
        height: 100,
        child: Center(child: CircularProgressIndicator()),
      ));
}
