import '../classes/string_list.dart';
import 'typed_list_model.dart';

class StringListModel extends StringList {
  const StringListModel({required super.values});

  List<String> toJson() {
    return TypedListModel(values: values).toJson((e) => e);
  }

  factory StringListModel.fromJson(List<dynamic> json) {
    return StringListModel(
      values: TypedListModel.fromJson(json, (e) => e as String).values,
    );
  }
}
