import '../json_serializers/list_json_serializer.dart';

abstract class ListJsonSerializerWrapper<Model,
    ModelJsonSerializer extends ListJsonSerializer<Model>> {
  ModelJsonSerializer jsonSerializer();
}
