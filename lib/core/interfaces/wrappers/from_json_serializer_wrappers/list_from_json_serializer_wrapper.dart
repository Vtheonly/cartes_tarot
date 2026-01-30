import '../../json_serializers/from_json_serializers/list_from_json_serializer.dart';

abstract class ListFromJsonSerializerWrapper<Model,
    ModelJsonSerializer extends ListFromJsonSerializer<Model>> {
  ModelJsonSerializer jsonSerializer();
}
