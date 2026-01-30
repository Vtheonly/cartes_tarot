import '../json_serializers/json_serializer.dart';

abstract class JsonSerializerWrapper<Model,
    ModelJsonSerializer extends JsonSerializer<Model>> {
  ModelJsonSerializer jsonSerializer();
}
