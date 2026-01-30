import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/theme_mode.dart';

part 'theme_mode_model.g.dart';

@JsonSerializable()
class ThemeModeModel extends ThemeMode {
  const ThemeModeModel({required super.name});

  factory ThemeModeModel.fromEntity(ThemeMode themeMode) =>
      ThemeModeModel(name: themeMode.name);

  factory ThemeModeModel.fromJson(Map<String, dynamic> json) =>
      _$ThemeModeModelFromJson(json);

  //factory ThemeModeModel.fromEntityScopedJson(Map<String, dynamic> json) =>
  //    ThemeModeModel.fromJson(json[ThemeModeModelCacheKeys.entityScope]);

  Map<String, dynamic> toJson() => _$ThemeModeModelToJson(this);

  //Map<String, dynamic> toEntityScopedJson() =>
  //    {ThemeModeModelCacheKeys.entityScope: toJson()};
}

class ThemeModeKeys {
  static const String entityScope = "themeMode";
  static const String kName = "name";
}

/*
class ThemeModeModelCacheKeys {
  //static const String entityScope = ThemeModeModel.entityScope;
  //static final String ckName = entityScope.dash(ThemeModeModelKeys.kName);
}
*/