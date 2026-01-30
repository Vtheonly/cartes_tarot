import 'from_json_serializers/from_json_serializer.dart';
import 'to_json_serializers/to_json_serializer.dart';

abstract class JsonSerializer<Model>
    implements ToJsonSerializer, FromJsonSerializer<Model> {}
