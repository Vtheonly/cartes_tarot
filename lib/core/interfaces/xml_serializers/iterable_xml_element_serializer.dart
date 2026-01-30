import 'from_xml_element_serializers/iterable_from_xml_element_serializer.dart';
import 'to_xml_element_serializers/iterable_to_xml_element_serializer.dart';

abstract class IterableXmlElementSerializer<Model>
    implements
        IterableToXmlElementSerializer,
        IterableFromXmlElementSerializer<Model> {}
