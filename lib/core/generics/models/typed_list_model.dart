import '../base_classes/typed_list.dart';

class TypedListModel<T> extends TypedList<T> {
  const TypedListModel({required super.values});

  List<R> toJson<R>(R Function(T) toJsonT) {
    return values.map((e) => toJsonT(e)).toList();
  }

  List<R> toIterable<R>(R Function(T) toElement) {
    return values.map((e) => toElement(e)).toList();
  }

  factory TypedListModel.fromJson(
      List<dynamic> json, T Function(dynamic) fromJson) {
    return TypedListModel(
      values: json.map((e) => fromJson(e)).toList(),
    );
  }

  factory TypedListModel.fromIterable(
      Iterable<dynamic> iterable, T Function(dynamic) fromElement) {
    return TypedListModel(
      values: iterable.map((e) => fromElement(e)).toList(),
    );
  }
}
