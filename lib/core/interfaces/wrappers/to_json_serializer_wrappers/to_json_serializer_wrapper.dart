import '../../json_serializers/to_json_serializers/to_json_serializer.dart';

abstract class ToJsonSerializerWrapper<
    ModelJsonSerializer extends ToJsonSerializer> {
  ModelJsonSerializer jsonSerializer();
}
