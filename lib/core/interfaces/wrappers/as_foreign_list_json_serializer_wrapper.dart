import '../json_serializers/list_json_serializer.dart';

abstract class AsForeignListJsonSerializerWrapper<Model,
    ModelJsonSerializer extends ListJsonSerializer<Model>> {
  ModelJsonSerializer jsonSerializerAsForeign();
}
