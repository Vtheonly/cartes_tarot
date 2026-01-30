import '../base_classes/field_map_list.dart';
import 'typed_list_model.dart';
import 'field_map_model.dart';

class FieldMapListModel<T> extends FieldMapList<T> {
  const FieldMapListModel({required super.values});

  List<Map<String, dynamic>> toJson<R>(R Function(T) toJsonT) {
    return TypedListModel(values: values)
        .toJson((e) => FieldMapModel.fromEntity(e).toJson(toJsonT));
  }

  List<Map<String, dynamic>> toJsonKV<R>(R Function(T) toJsonT) {
    return TypedListModel(values: values)
        .toJson((e) => FieldMapModel.fromEntity(e).toJsonKV(toJsonT));
  }

  factory FieldMapListModel.fromJson(
      List<dynamic> json, T Function(dynamic) fromJsonT) {
    return FieldMapListModel(
      values: TypedListModel.fromJson(
          json, (e) => FieldMapModel.fromJson(e, fromJsonT)).values,
    );
  }

  factory FieldMapListModel.fromJsonKV(
      List<dynamic> json, T Function(dynamic) fromJsonT) {
    return FieldMapListModel(
      values: TypedListModel.fromJson(
          json, (e) => FieldMapModel.fromJsonKV(e, fromJsonT)).values,
    );
  }
}
