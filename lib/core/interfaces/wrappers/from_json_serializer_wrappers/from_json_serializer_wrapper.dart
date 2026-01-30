import '../../json_serializers/from_json_serializers/from_json_serializer.dart';

abstract class FromJsonSerializerWrapper<Model,
    ModelJsonSerializer extends FromJsonSerializer<Model>> {
  ModelJsonSerializer jsonSerializer();
}
