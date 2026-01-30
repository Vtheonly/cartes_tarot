import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/error/exceptions/exceptions.dart';
import '../../models/theme_mode_model.dart';

abstract class ThemeModeSettingsLocalDataSource {
  /// Throws [CacheException] if no cached data is present.
  Future<ThemeModeModel> getThemeMode();

  /// Throws [CacheException] if cache failed.
  Future<void> cacheThemeMode(ThemeModeModel themeMode);
}

class ThemeModeSettingsLocalDataSourceImpl
    implements ThemeModeSettingsLocalDataSource {
  final SharedPreferences sharedPreferences;

  ThemeModeSettingsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheThemeMode(ThemeModeModel themeMode) async {
    final isCached = await sharedPreferences.setString(
        ThemeModeKeys.entityScope, json.encode(themeMode.toJson()));
    if (!isCached) throw CacheException();
  }

  @override
  Future<ThemeModeModel> getThemeMode() async {
    final jsonString = sharedPreferences.getString(ThemeModeKeys.entityScope);
    if (jsonString != null) {
      return ThemeModeModel.fromJson(json.decode(jsonString));
    }
    throw CacheException();
  }
}
