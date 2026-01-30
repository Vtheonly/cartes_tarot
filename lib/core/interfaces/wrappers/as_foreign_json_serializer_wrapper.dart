import '../json_serializers/json_serializer.dart';

abstract class AsForeignJsonSerializerWrapper<Model,
    ModelJsonSerializer extends JsonSerializer<Model>> {
  ModelJsonSerializer jsonSerializerAsForeign();
}
