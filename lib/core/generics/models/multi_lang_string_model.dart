import 'package:json_annotation/json_annotation.dart';

import '../classes/multi_lang_string.dart';

part "multi_lang_string_model.g.dart";

@JsonSerializable()
class MultiLangStringModel extends MultiLangString {
  const MultiLangStringModel(
      {required super.ar, required super.en, required super.fr});

  factory MultiLangStringModel.fromJson(Map<String, dynamic> json) =>
      _$MultiLangStringModelFromJson(json);

  MultiLangStringModel.fromEntity(MultiLangString e)
      : super(ar: e.ar, en: e.en, fr: e.fr);

  Map<String, dynamic> toJson() => _$MultiLangStringModelToJson(this);
}

class MultiLangStringKeys {
  static const String ar = 'ar';
  static const String en = 'en';
  static const String fr = 'fr';
}
