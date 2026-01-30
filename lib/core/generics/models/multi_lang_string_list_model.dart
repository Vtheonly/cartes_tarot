import '../classes/multi_lang_string_list.dart';
import 'multi_lang_string_model.dart';
import 'typed_list_model.dart';

class MultiLangStringListModel extends MultiLangStringList {
  const MultiLangStringListModel({required super.values});

  List<Map<String, dynamic>> toJson() {
    return TypedListModel(values: values)
        .toJson((e) => MultiLangStringModel.fromEntity(e).toJson());
  }

  factory MultiLangStringListModel.fromJson(List<dynamic> json) {
    return MultiLangStringListModel(
      values:
          TypedListModel.fromJson(json, (e) => MultiLangStringModel.fromJson(e))
              .values,
    );
  }
}
