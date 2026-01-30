import 'from_json_serializers/list_from_json_serializer.dart';
import 'to_json_serializers/list_to_json_serializer.dart';

abstract class ListJsonSerializer<Model>
    implements ListToJsonSerializer, ListFromJsonSerializer<Model> {}
