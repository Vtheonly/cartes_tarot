import '../../json_serializers/to_json_serializers/list_to_json_serializer.dart';

abstract class ListToJsonSerializerWrapper<
    ModelJsonSerializer extends ListToJsonSerializer> {
  ModelJsonSerializer jsonSerializer();
}
